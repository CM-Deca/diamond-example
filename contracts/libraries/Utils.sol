// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import './Math.sol';
import './Type.sol';

library Utils {
    bytes16 private constant HEX = '0123456789abcdef';

    function keygen(address o, uint i) internal view returns (bytes32) {
        return keccak256(abi.encodePacked(o, block.timestamp, i));
    }

    function asm_pack(uint64 t, uint8 c, uint8 o, uint8 s) internal pure returns (uint i) {
        assembly {
            i := or(or(or(t, shl(64, c)), shl(72, o)), shl(80, s))
        }
    }

    function pack(Type.OrderInfo memory i) internal pure returns (uint) {
        return (uint(uint8(i.state)) << 80) | (uint(uint8(i.option)) << 72) | (uint(uint8(i.category)) << 64) | uint(i.time);
    }

    function unpack(uint i) internal pure returns (Type.OrderInfo memory) {
        return Type.OrderInfo(Type.Category(uint8(uint(i) >> 64)), Type.Option(uint8(uint(i) >> 72)), Type.State(uint8(uint(i) >> 80)), uint64(i));
    }

    function to_string(uint v) internal pure returns (string memory) {
        unchecked {
            uint l = Math.log10(v) + 1;
            string memory b = new string(l);
            uint ptr;
            /// @solidity memory-safe-assembly
            assembly {
                ptr := add(b, add(32, l))
            }
            while (true) {
                ptr--;
                /// @solidity memory-safe-assembly
                assembly {
                    mstore8(ptr, byte(mod(v, 10), HEX))
                }
                v /= 10;
                if (v == 0) break;
            }
            return b;
        }
    }

    function fix(uint n, uint d, uint x, bool s, bool m) internal pure returns (string memory r) {
        unchecked {
            r = to_string(n);
            bytes memory t = bytes(r);
            bytes1 u;
            uint l = t.length;
            uint num;
            uint o;
            if (l > d) {
                num = l - d;
                l = num > 1 ? num : l;
                if (m) {
                    if (num > 12) {
                        num %= 12;
                        u = 'T';
                    } else if (num > 9) {
                        num %= 9;
                        u = 'B';
                    } else if (num > 6) {
                        num %= 6;
                        u = 'M';
                    }
                    l = num;
                }
            } else {
                o = d - l;
            }

            bytes memory v;
            uint z = o;
            uint i;
            uint j;
            while (i <= l) {
                if (num == i) {
                    if (num == 0) v = abi.encodePacked(v, '0');
                    if (num < l) v = abi.encodePacked(v, '.');
                } else if (num > i) {
                    v = abi.encodePacked(v, t[i]);
                    if (s && i + 1 < num && i + 1 >= (num % 3) && (num - (i + 1)) % 3 == 0) {
                        v = abi.encodePacked(v, ',');
                    }
                } else {
                    if (z > 0) {
                        while (z != 0) {
                            v = abi.encodePacked(v, '0');
                            z--;
                        }
                    }
                    j = num > 0 ? i - num : i - 1;
                    if (t[j] == '0') {
                        break;
                    } else {
                        v = abi.encodePacked(v, t[j]);
                        if (x > 0 && x < j + o + (num > 0 ? num + 1 : num + 3)) break;
                    }
                }
                i++;
            }
            r = s && u != '' ? string(abi.encodePacked(v, u)) : string(v);
        }
    }

    function color(uint t, uint o) internal pure returns (string memory str) {
        return string(to_hex((t >> o), 3));
    }

    function toHexString(bytes32 data, uint l) internal pure returns (string memory) {
        return string(abi.encodePacked('0x', to_hex(uint(data), l)));
    }

    function to_hex(uint v, uint l) internal pure returns (string memory) {
        bytes memory b = new bytes(2 * l);
        for (uint i = b.length; i > 0; i--) {
            b[i - 1] = HEX[v & 0xf];
            v >>= 4;
        }
        return string(b);
    }
}
