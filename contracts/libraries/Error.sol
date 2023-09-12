// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

library ERROR {
    error CODE(TYPE __);

    enum TYPE {
        LOCKED,                     // 0
        REENTRANCY,                 // 1
        NO_PERMISSION,              // 2
        IMPOSSIBLE_MINT,            // 3
        WRONG_REQUEST,              // 4
        BANNED_ACCOUNT,             // 5
        MISMATCH_OWNER,             // 6
        MISMATCH_MARKET,            // 7
        EXIST_TOKEN,                // 8
        EXIST_MARKET,               // 9
        UNSUPPORTED_CURRENCY,       // 10
        NOT_ENOUGH_MECA,            // 11
        NOT_ENOUGH_LIQUIDITY,       // 12
        NOT_ENOUGH_REWARDS,         // 13
        NOT_FILLED_YET,             // 14
        NOT_STAKE_YET,              // 15
        INSUFFICIENT_AMOUNT,        // 16
        INSUFFICIENT_BALANCE,       // 17
        INSUFFICIENT_REWARD,        // 18
        INSUFFICIENT_LIQUIDITY,     // 19
        CANNOT_LIST_NATIVE_TOKEN,   // 20
        ZERO_PRICE,                 // 21
        LOW_PRICE,                  // 22
        LOW_AMOUNT,                 // 23
        LOW_QUANTITY,               // 24
        LOW_REWARD,                 // 25
        NOT_FILLED,                 // 26
        ALREADY_FILLED,             // 27
        ALREADY_CLAIMED,            // 28
        NO_LEVERAGE,                // 29
        NO_REWARD                   // 30
    }

    error HISTORY(uint code);
    uint public constant NO_HISTORY = 34;

    error DAPP(uint code);
    // MODIFIER & SINGLE FUNCTION
    uint public constant NO_PERMISSION_DAPP = 35;
    uint public constant NO_PERMISSIONAUTH_DAPP = 36;

    error DAPPUPGRADE(uint code);
    // MODIFIER & SINGLE FUNCTION
    uint public constant NO_PERMISSION_DAPPUPGRADE = 37;
    uint public constant NO_PERMISSIONAUTH_DAPPUPGRADE = 38;

    error CREDIT(uint code);
    uint public constant APP_NOT_EXIST_remove_app = 63;
    uint public constant APP_NOT_EXIST_increase_point = 64;
    uint public constant BANNED_ACCOUNT_increase_point = 65;
    uint public constant APP_NOT_EXIST_increase_score = 66;
    uint public constant BANNED_ACCOUNT_increase_score = 67;
    uint public constant APP_NOT_EXIST_increase_point_score = 68;
    uint public constant BANNED_ACCOUNT_increase_point_score = 69;
    uint public constant APP_NOT_EXIST_decrease_point = 70;
    uint public constant BANNED_ACCOUNT_decrease_point = 71;
    uint public constant APP_NOT_EXIST_decrease_score = 72;
    uint public constant BANNED_ACCOUNT_decrease_score = 73;
    uint public constant APP_NOT_EXIST_decrease_point_score = 74;
    uint public constant BANNED_ACCOUNT_decrease_point_score = 75;
    uint public constant APP_NOT_EXIST_set_point = 76;
    uint public constant BANNED_ACCOUNT_set_point = 77;
    uint public constant APP_NOT_EXIST_set_score = 78;
    uint public constant BANNED_ACCOUNT_set_score = 79;
    uint public constant APP_NOT_EXIST_set_point_score = 80;
    uint public constant BANNED_ACCOUNT_set_point_score = 81;
    uint public constant APP_NOT_EXIST_get_user = 82;
    uint public constant BANNED_ACCOUNT_get_user = 83;
    uint public constant APP_NOT_EXIST_get_point = 84;
    uint public constant BANNED_ACCOUNT_get_point = 85;
    uint public constant APP_NOT_EXIST_get_score = 86;
    uint public constant BANNED_ACCOUNT_get_score = 87;
    uint public constant APP_NOT_EXIST_get_point_score = 88;
    uint public constant BANNED_ACCOUNT_get_point_score = 89;
    uint public constant APP_NOT_EXIST_ban_user = 90;
    uint public constant APP_NOT_EXIST_ban_check = 91;
    uint public constant HAS_NOT_CREDIT = 92;
}
