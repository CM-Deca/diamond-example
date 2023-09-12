// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// 공유 변수 저장소
struct AppStorage {
    uint256 firstVar;
    uint256 secondVar;
    uint256 lastVar;
    // add other state variables ...
}

library LibAppStorage {

    function appStorage() internal pure returns (AppStorage storage ds) {    
        assembly { ds.slot := 0 }
    }
    
    // 공유 저장소에 특정 기능을 탑재 시킬수도있음 
    function someFunction() internal {
        AppStorage storage s = appStorage();
        s.firstVar = 8;
    }
}