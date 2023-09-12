// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import '../libraries/Type.sol';

interface IdApp {
    struct Info {
        string name;
        string symbol;
        string version;
        string url;
        string description;
    }

    struct Service {
        uint id;
        address service;
    }

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function version() external view returns (string memory);

    function url() external view returns (string memory);

    function description() external view returns (string memory);

    function info() external view returns (Info memory);

    function set_name(string memory _name) external;

    function set_symbol(string memory _symbol) external;

    function set_version(string memory _version) external;

    function set_url(string memory _url) external;

    function set_description(string memory _description) external;

    function set_info(string memory _name, string memory _symbol, string memory _version, string memory _url, string memory _description) external;

    function service(uint _id) external view returns (address);

    function add_service(address _service) external returns (uint);

    function set_service(uint _id, address _service) external;

    function get_service() external view returns (Service[] memory s);

    function set_auth(address _auth) external;

    function set_permission(address _address, bool _permission) external;

    function check_permission(address _address) external view returns (bool);

    function history_push(Type.Order memory _order) external returns (bytes32);

    function history_set(Type.Order memory _order) external;

    function history_set_state(bytes32 _key, Type.State _state) external;

    function history_transfer(address _to, bytes32 _key) external;

    function history_remove(bytes32 _key) external;

    function history_get(bytes32 _key) external view returns (Type.Order memory);

    function history_get_by_index(address _owner, uint _i) external view returns (Type.Order memory);

    function history_get_all(address _owner) external view returns (Type.Order[] memory);

    function history_get_count(address _owner) external view returns (uint);

    function set_user_name(string calldata _name) external;

    function set_user_img(string calldata _img) external;

    function set_user_profile(string calldata _name, string calldata _img) external;

    function credit_increase_point(address _user, uint _point) external returns (uint);

    function credit_increase_score(address _user, uint _score) external returns (uint);

    function credit_increase_point_score(address _user, uint _point, uint _score) external returns (uint, uint);

    function credit_decrease_point(address _user, uint _point) external returns (uint);

    function credit_decrease_score(address _user, uint _score) external returns (uint);

    function credit_decrease_point_score(address _user, uint _point, uint _score) external returns (uint, uint);

    function credit_set_point(address _user, uint _point) external;

    function credit_set_score(address _user, uint _score) external;

    function credit_set_point_score(address _user, uint _point, uint _score) external;

    function credit_get_user(address _user) external view returns (Type.User memory);

    function credit_get_user_info(address _user) external view returns (Type.UserInfo memory);

    function credit_get_point(address _user) external view returns (uint);

    function credit_get_score(address _user) external view returns (uint);

    function credit_get_point_score(address _user) external view returns (uint, uint);

    function ban_user(address _user, bool _state) external;

    function ban_check(address _user) external view returns (bool);
}
