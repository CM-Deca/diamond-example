// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
//import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
//@author BoringCrypto (https://github.com/boringcrypto/BoringSolidity/blob/master/contracts/libraries/BoringERC20.sol)

library Currency {
    bytes4 private constant SIG_SYMBOL = 0x95d89b41; // symbol()
    bytes4 private constant SIG_NAME = 0x06fdde03; // name()
    bytes4 private constant SIG_DECIMALS = 0x313ce567; // decimals()
    bytes4 private constant SIG_BALANCE_OF = 0x70a08231; // balanceOf(add ress)
    bytes4 private constant SIG_TRANSFER = 0xa9059cbb; // transfer(address,uint)
    bytes4 private constant SIG_TRANSFER_FROM = 0x23b872dd; // transferFrom(address,address,uint)
    bytes4 private constant SIG_APPROVE = 0x095ea7b3; // approve(address,uint256)
    bytes4 private constant SIG_TOTAL_SUPPLY = 0x18160ddd; // totalSupply() 18160ddd

    function returnDataToString(bytes memory data) internal pure returns (string memory) {
        if (data.length >= 64) {
            return abi.decode(data, (string));
        } else if (data.length == 32) {
            uint8 i = 0;
            while (i < 32 && data[i] != 0) {
                i++;
            }
            bytes memory bytesArray = new bytes(i);
            for (i = 0; i < 32 && data[i] != 0; i++) {
                bytesArray[i] = data[i];
            }
            return string(bytesArray);
        } else {
            return '???';
        }
    }

    function symbol(address token) internal view returns (string memory) {
        if (token == address(0)) return 'ETH';
        else {
            (bool success, bytes memory data) = address(token).staticcall(abi.encodeWithSelector(SIG_SYMBOL));
            return success ? returnDataToString(data) : '???';
        }
    }

    function name(address token) internal view returns (string memory) {
        if (token == address(0)) return 'Ethreum Coin';
        else {
            (bool success, bytes memory data) = address(token).staticcall(abi.encodeWithSelector(SIG_NAME));
            return success ? returnDataToString(data) : '???';
        }
    }

    function decimals(address token) internal view returns (uint8) {
        if (token == address(0)) return 18;
        else {
            (bool success, bytes memory data) = address((token)).staticcall(abi.encodeWithSelector(SIG_DECIMALS));
            return success && data.length == 32 ? abi.decode(data, (uint8)) : 18; // 그외 모든것들은 18로 반환
        }
    }

    function balanceOf(address token, address to) internal view returns (uint amount) {
        if (token == address(0)) return token.balance;
        else {
            (bool success, bytes memory data) = address(token).staticcall(abi.encodeWithSelector(SIG_BALANCE_OF, to));
            require(success && data.length >= 32, 'Currency ERC20: BalanceOf failed');
            amount = abi.decode(data, (uint));
        }
    }

    function transfer(address token, address to, uint amount) internal {
        if (token == address(0)) {
            (bool success, ) = payable(to).call{value: amount}('');
            require(success, 'Native Currency Transfer Fail');
        } else {
            (bool success, bytes memory data) = address(token).call(abi.encodeWithSelector(SIG_TRANSFER, to, amount));
            require(success && (data.length == 0 || abi.decode(data, (bool))), 'Currency ERC20: Transfer failed');
        }
    }

    function transferFrom(address token, address from, address to, uint amount) internal {
        if (token == address(0) && amount <= msg.value) {
            if (address(this) != to) {
                (bool success, ) = payable(to).call{value: amount}('');
                require(success, 'Native Currency Transfer Fail');
            }
        } else {
            (bool success, bytes memory data) = address(token).call(abi.encodeWithSelector(SIG_TRANSFER_FROM, from, to, amount));
            require(success && (data.length == 0 || abi.decode(data, (bool))), 'Currency ERC20: TransferFrom failed');
        }
    }

    function approve(address token, address from, uint amount) internal {
        if (token != address(0)) {
            (bool success, bytes memory data) = address(token).call(abi.encodeWithSelector(SIG_APPROVE, from, amount));
            require(success && (data.length == 0 || abi.decode(data, (bool))), 'Currency ERC20: Approve failed');
        }
    }

    function totalSupply(address token) internal view returns (uint) {
        if (token != address(0)) {
            (bool success, bytes memory data) = address(token).staticcall(abi.encodeWithSelector(SIG_TOTAL_SUPPLY));
            require(success && data.length >= 32, 'Currency ERC20: TotalSupply failed');
            return abi.decode(data, (uint));
        }
        return type(uint256).max; //네이티브만
    }
}
