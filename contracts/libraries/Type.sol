// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

library Type {
    enum Category {
        Order,
        Buy,
        Sell,
        Deposit,
        Withdraw,
        Stake,
        Unstake,
        Claim,
        Long,
        Short
    }

    enum Option {
        General,
        Market,
        Limit
    }

    enum State {
        Pending,
        Filled,
        Claimable,
        Complete,
        Cancel,
        Open,
        Close,
        Liquidation
    }

    struct Status {
        State state;
        uint time;
    }

    struct Position {
        uint ask;
        uint bid;
    }

    // for packing
    struct OrderInfo {
        Category category;
        Option option;
        State state;
        uint time;
    }

    struct OrderPack {
        bytes32 key;
        uint info; // packed orderInfo
        uint price;
        uint amount;
        uint quantity;
        uint fees;
        address pay;
        address item;
        address owner;
        address market;
    }

    // get_all order
    struct Order {
        bytes32 key;
        Category category; // unpacked order info
        Option option; // unpacked order info
        State state; // unpacked order info
        uint time; // unpacked order info
        uint price;
        uint amount;
        uint quantity;
        uint fees;
        address pay;
        address item;
        address owner;
        address market;
    }

    struct Token {
        bool key;
        address addr;
        string name;
        string symbol;
        uint8 decimals;
        uint treasury;
        uint rate;
        uint weight;
        int need;
    }

    struct TokenInfo{
        address addr;
        string name;
        string symbol;
        uint8 decimals;
    }

    struct Profile {
        string name;
        string img;
        address user;
    }

    struct Credit {
        uint point;
        uint score;
        string app;
    }

    struct User {
        uint point;
        uint score;
        string name;
        string img;
        string app;
        address user;
    }

    struct UserInfo {
        string name;
        string img;
        address user;
        Credit[] credit;
    }

    struct Liquidity {
        uint amount;
        address token;
    }

    struct Market {
        address orderbook;
        address nft;
        TokenInfo base;
        TokenInfo quote;
        uint price;
        uint tick;
        uint8 fee;
        uint8 threshold;
        bool lock;
    }
    
    // struct Market {
    //     address orderbook;
    //     address nft;
    //     string symbol;
    //     string name;
    //     address base;
    //     address quote;
    //     uint price;
    //     uint tick;
    //     uint8 fee;
    //     bool lock;
    // }

    struct Tick {
        uint price;
        uint balance;
    }

    struct BookOrder {
        uint queue;
        bytes32 key;
    }

    struct Orderbook {
        Tick[] asks;
        Tick[] bids;
    }

    struct Farm {
        address farm;
        string name;
        address stake;
        string stake_symbol;
        string stake_name;
        uint stake_decimals;
        address earn;
        string earn_symbol;
        string earn_name;
        uint earn_decimals;
        uint start;
        uint period;
        uint goal;
        uint rewards;
        uint locked;
    }

    struct Staking {
        address user;
        uint start;
        uint period;
        uint amount;
        uint reward;
        uint profit; // 수익률
        // uint apy;
    }
}
