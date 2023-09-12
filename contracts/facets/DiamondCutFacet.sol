// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import { IDiamondCut } from "../interfaces/IDiamondCut.sol";
import { LibDiamond } from "../storage/LibDiamond.sol";

contract DiamondCutFacet is IDiamondCut {
    // delegate call을 통해서 추가,교체,제거 가능
    function diamondCut(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata
    ) external override {
        //LibDiamond.enforceIsContractOwner(); // owner 관련 함수임
        // 여기서는 다이아몬드-스토리지에 있는 걸 호출 -> 여기에 그냥 사용해도 되겠지 
        LibDiamond.diamondCut(_diamondCut, _init, _calldata); 
    }

}
