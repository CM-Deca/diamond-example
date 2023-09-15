// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import {markdia} from './markdia.sol';
import {Storage} from './Storage.sol';
import {OrderStorage} from './OrderStorage.sol';
 import { IDiamondCut } from "../interfaces/IDiamondCut.sol";

contract orderdia is markdia{

    constructor(address _market) payable {
        OrderStorage.Props storage s = OrderStorage.load();
        s.market = _market;
    }

    fallback() external payable {
        OrderStorage.Props storage n = OrderStorage.load();

        Storage.Private storage s = markdia(payable(n.market))._this();
        bytes32 key = markdia(payable(n.market)).getPrivateKey();
        assembly {
            s.slot := key
        }
        address facet = s.facet[msg.sig].facet;
        if (facet == address(0)) {
            revert(msg.sig);
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
