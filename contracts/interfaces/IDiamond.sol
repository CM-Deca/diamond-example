// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 다이아몬드 인터페잇스인데 .. 


interface IDiamond {
    enum FacetCutAction {Add, Replace, Remove}
    // Add=0, Replace=1, Remove=2

    // 다이아몬드에 부착될 기능 
    // 
    struct FacetCut {
        address facetAddress; // 기능 컨트랙트 주소 
        FacetCutAction action; // 기능의 액션 상태
        bytes4[] functionSelectors; // 기능의 함수들
    }

    event DiamondCut(FacetCut[] _diamondCut, address _init, bytes _calldata);
}