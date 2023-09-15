// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import {Storage} from './Storage.sol';
 import { IDiamondCut } from "../interfaces/IDiamondCut.sol";

struct DiamondArgs {
    address owner;
    address init;
    bytes initCalldata;
}

contract markdia {
    using Storage for Storage.Private;
    Storage.Private internal s;

    constructor(IDiamondCut.FacetCut[] memory _diamondCut, DiamondArgs memory _args) payable {
        Storage.setContractOwner(_args.owner);
        Storage.diamondCut(_diamondCut, _args.init);
    }

    fallback() external payable {
        bytes32 key = Storage.privateKey;
        assembly {
            s.slot := key
        }
        address facet = s.facet[msg.sig].facet;
        if (facet == address(0)) {
            revert('a');
        }
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), facet, 0, calldatasize(), 0, 0)
            // get any return value
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {
                revert(0, returndatasize())
            }
            default {
                return(0, returndatasize())
            }
        }
    }
    receive() external payable {}
}
