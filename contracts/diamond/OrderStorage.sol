// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;


 import { IDiamond } from "../interfaces/IDiamond.sol";
 import { IDiamondCut } from "../interfaces/IDiamondCut.sol";

library OrderStorage {
    // 수정필요 // coinmeca.orderbook.ETH.DAI.storage 같이 다이나믹하게 스토리지를 생성해야하나?
    bytes32 constant key = keccak256('coinmeca.orderbook.storage');

    struct Props {
        uint price;
        address market;
    }

    function load() internal pure returns (Props storage s) {
        bytes32 __ = key;
        assembly {
            s.slot := __
        }
    }

}
