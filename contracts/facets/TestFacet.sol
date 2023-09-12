// SPDX-License-Identifier: CC0-1.0
pragma solidity ^0.8.0;

import "../storage/LibDiamond.sol"; // app다이아몬드에 있는 저장소에 접근하기위해서 선언 , 다이아몬드 스토리지 -> libdiamond를 사용 
import { AppStorage } from "../storage/LibAppStorage.sol";

contract TestFacet {
  AppStorage internal s; // A기능(Facet)에 state variable 선언 -> 무조건 하나만 선언   

  function test1Func1() external view returns(string memory) {
    LibDiamond.DiamondStorage storage ds = LibDiamond.getStorage();
    return ds.name;
  }

  function test1Func2(uint256 va) external {
    s.firstVar = va;
  }

  function test1Func3() external view returns (uint){
    return s.firstVar;
  }
    
  //function supportsInterface(bytes4 _interfaceID) external view returns (bool) {}
}
