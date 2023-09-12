// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

library Calculator {
    function get_digit(uint p) internal pure returns (uint d) {
        unchecked {
            d = 1;
            if (p >= 1e1) {
                assembly {
                    p := div(p, 10)
                }
                if (p < 1e1) {
                    d = 2;
                } else if (p < 1e2) {
                    d = 3;
                } else if (p < 1e3) {
                    d = 4;
                } else if (p < 1e4) {
                    d = 5;
                } else if (p < 1e5) {
                    d = 6;
                } else if (p < 1e6) {
                    d = 7;
                } else if (p < 1e7) {
                    d = 8;
                } else if (p < 1e8) {
                    d = 9;
                } else if (p < 1e9) {
                    d = 10;
                } else if (p < 1e10) {
                    d = 11;
                } else if (p < 1e11) {
                    d = 12;
                } else if (p < 1e12) {
                    d = 13;
                } else if (p < 1e13) {
                    d = 14;
                } else if (p < 1e14) {
                    d = 15;
                } else if (p < 1e15) {
                    d = 16;
                } else if (p < 1e16) {
                    d = 17;
                } else if (p < 1e17) {
                    d = 18;
                } else if (p < 1e18) {
                    d = 19;
                } else if (p < 1e19) {
                    d = 20;
                } else if (p < 1e20) {
                    d = 21;
                } else if (p < 1e21) {
                    d = 22;
                } else if (p < 1e22) {
                    d = 23;
                } else if (p < 1e23) {
                    d = 24;
                } else if (p < 1e24) {
                    d = 25;
                } else if (p < 1e25) {
                    d = 26;
                } else if (p < 1e26) {
                    d = 27;
                } else if (p < 1e27) {
                    d = 28;
                } else if (p < 1e28) {
                    d = 29;
                } else if (p < 1e29) {
                    d = 30;
                } else if (p < 1e30) {
                    d = 31;
                } else if (p < 1e31) {
                    d = 32;
                } else if (p < 1e32) {
                    d = 33;
                } else if (p < 1e33) {
                    d = 34;
                } else if (p < 1e34) {
                    d = 35;
                } else if (p < 1e35) {
                    d = 36;
                } else if (p < 1e36) {
                    d = 37;
                } else {
                    p /= 1e36;
                    d = 37;
                    while (p != 0) {
                        p /= 10;
                        d++;
                    }
                }
            }
        }
    }

    function get_tick(uint p) internal pure returns (uint t) {
        t = 10 ** (get_digit(p) > 4 ? get_digit(p) - 4 : get_digit(p));
    }

    function floor(uint p) internal pure returns (uint r) {
        unchecked {
            uint d = get_tick(p);
            r = p - (p % d);
        }
    }

    function per_tick(uint l, uint p, uint t, uint i) internal pure returns (uint) {
        unchecked {
            int l_ = int(l * 1e18);
            int r = int(((p / t) + i) * 1e18);
            // int r = int(((p / t / 8) + (i * 8)) * 1e18);
            int d = int((-(l_ / int(p)) * 8) + (r / 2)) / 1e3;
            int s = d > int(1e18) ? int(1e18) : d < -1e18 ? -1e18 : d;

            return uint((((((l_ / (3 * r)) * (((r * s) - (int(4e18) * int(i) * s)) / r)) / 1e18) + (l_ / r)) * (1e18 + ((s * 1e18) / (3e18 - s)))) / 1e18);
        }
    }

    function get_price(uint a, uint q) internal pure returns (uint r) {
        unchecked {
            if (a > 0 && q > 0) {
                r = a > q ? (a * 1e18) / q : (q * 1e18) / a;
            }
        }
    }

    function to_amount(uint q, uint p) internal pure returns (uint) {
        unchecked {
            return q > 0 ? (q * p) / 1e18 : 0;
        }
    }

    function to_quantity(uint a, uint p) internal pure returns (uint) {
        unchecked {
            return a > 0 ? (1e18 * a) / p : 0;
        }
    }

    function convert(uint a, uint p, bool t) internal pure returns (uint) {
        unchecked {
            return t ? to_quantity(a, p) : to_amount(a, p);
        }
    }

    function get_fees(uint q, uint f, uint d) internal pure returns (uint r) {
        unchecked {
            r = (q * f) / d;
            r = r < 1 ? 1 : r;
        }
    }

    function get_threshold(uint p, uint a, uint m, uint t, bool c) internal pure returns (uint) {
        unchecked {
            int d = (int(p) * (int(a) - ((int(m) * (c ? 100 - int(t) : 100 + int(t))) / 100))) / int(a);
            p = floor(d <= 0 ? 1 : uint(d));
            if (c) {
                return p + get_tick(p);
            } else {
                return p - get_tick(p);
            }
        }
    }

    function div(uint x, uint y) internal pure returns (uint) {
        unchecked {
            return x >= y ? x / y : y / x;
        }
    }

    function div_min(uint x, uint y, uint m) internal pure returns (uint r) {
        unchecked {
            r = div(x, y);
            r = m > r ? m : r;
        }
    }

    function format(uint n, uint d) internal pure returns (uint r) {
        unchecked {
            r = 18 - d;
            r = r > 0 ? n / (10 ** (18 - d)) : n;
        }
    }

    function parse(uint n, uint d) internal pure returns (uint r) {
        unchecked {
            r = 18 - d;
            r = r > 0 ? n * (10 ** d) : n;
        }
    }
}
