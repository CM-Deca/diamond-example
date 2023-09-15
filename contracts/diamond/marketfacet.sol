// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import './Storage.sol';
import './orderdia.sol';

contract marketfacet  {
    using Storage for Storage.Props;
    Storage.Props internal s;
 
    function markget() public view returns(address){
        return s.contracts;
    }

    function create(address marketaddr) public view returns(address){
        orderdia or = new orderdia(marketaddr);
        return address(or);
    }
}
