// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.0;

import './OrderStorage.sol';

contract orderfacet  {
    using OrderStorage for OrderStorage.Props;
    OrderStorage.Props internal s;
 
    function testset(uint v) public {
        s.price = v;
    }
    function testget() public view returns(uint){
        return s.price;
    }
    
}
