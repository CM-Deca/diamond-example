// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

library OrderFactor {
    struct Factor {
        uint value;
    }

    function set_pack(Factor storage self, uint8 l, uint8 f, uint8 y, uint8 r, uint16 d, uint16 c) internal returns (uint b) {
        assembly {
            b := or(or(or(or(or(c, shl(0x10, d)), shl(0x20, r)), shl(0x28, y)), shl(0x30, f)), shl(0x38, l))
        }
        self.value = b;
    }

    function get_unpack(Factor storage self) internal view returns (uint8 l, uint8 f, uint8 y, uint8 r, uint16 d, uint16 c) {
        uint b = self.value;
        assembly {
            c := shr(0x00, b)
            d := shr(0x10, b)
            r := shr(0x20, b)
            y := shr(0x28, b)
            f := shr(0x30, b)
            l := shr(0x38, b)
        }
    }

    function set_lock(Factor storage self, uint8 lock) internal {
        self.value = uint(lock) << 0x38;
    }

    function get_lock(Factor storage self) internal view returns (uint8 lock) {
        uint _value = self.value;
        lock = uint8(_value >> 0x38);
    }

    function set_fee(Factor storage self, uint8 fee) internal {
        self.value = uint(fee) << 0x30;
    }

    function get_fee(Factor storage self) internal view returns (uint8 fee) {
        uint _value = self.value;
        fee = uint8(_value >> 0x30);
    }

    function set_yield(Factor storage self, uint8 yield) internal {
        self.value = uint(yield) << 0x28;
    }

    function get_yield(Factor storage self) internal view returns (uint8 yield) {
        uint _value = self.value;
        yield = uint8(_value >> 0x28);
    }

    function set_reward(Factor storage self, uint8 reward) internal {
        self.value = uint(reward) << 0x20;
    }

    function get_reward(Factor storage self) internal view returns (uint8 reward) {
        uint _value = self.value;
        reward = uint8(_value >> 0x20);
    }

    function set_divider(Factor storage self, uint16 divider) internal {
        self.value = uint(divider) << 0x10;
    }

    function get_divider(Factor storage self) internal view returns (uint16 divider) {
        uint _value = self.value;
        divider = uint16(_value >> 0x10);
    }

    function set_limit(Factor storage self, uint16 limit) internal {
        self.value = uint16(limit);
    }

    function get_limit(Factor storage self) internal view returns (uint16 limit) {
        uint _value = self.value;
        limit = uint16(_value);
    }
}
