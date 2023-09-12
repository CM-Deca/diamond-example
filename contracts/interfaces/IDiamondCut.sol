// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import { IDiamond } from "./IDiamond.sol";

interface IDiamondCut is IDiamond {    

    // 다이아몬드에 기능들 부착해주는 함수
    function diamondCut(
        FacetCut[] calldata _diamondCut,
        address _init,
        bytes calldata _calldata
    ) external;    

}
