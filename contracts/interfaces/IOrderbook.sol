// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import '../libraries/Type.sol';
import '../libraries/Calculator.sol';
import '../libraries/OrderFactor.sol';

interface IOrderbook {
    event Bid(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy);
    event Ask(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy);
    event Buy(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy, uint _quantity);
    event Sell(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy, uint _quantity);
    event Long(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy, uint _leverage);
    event Short(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy, uint _leverage);
    event Claim(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy, uint _quantity);
    event Liquidation(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy, uint _quantity);
    event Close(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy, uint _quantity);
    event Cancel(address indexed _owner, address indexed _sell, uint _amount, uint _price, address indexed _buy);

    function order(uint8 _option, address _sell, uint _amount, uint _margin, uint _price) external payable;

    function claim(bytes32 _key) external;

    function check(bytes32 _key) external view returns (bool);

    function liquidation(bytes32 _key) external view returns (bool);

    function margin(bytes32 _key, bool _type, address _token, uint _amount) external payable returns (uint p);

    function cancel(bytes32 _key) external;

    function get_ticks(Type.Category _category, uint16 _range) external view returns (Type.Tick[] memory);

    function get_info() external view returns (address, address, address, uint, uint, uint8, uint8, bool);

    // function set_threshold(uint8 _threshold) external;

    // function set_fee(uint8 _fee) external;

    // function set_reward(uint8 _reward) external;

     function set_lock(bool _lock) external;

    // function set_call_limit(uint16 _limit) external;
}
