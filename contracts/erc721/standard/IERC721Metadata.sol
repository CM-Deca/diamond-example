// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC721} from "./IERC721.sol";

// 721 메타 데이터 인터페이스 표준
interface IERC721Metadata is IERC721 {
    /**
     * @dev Returns the token collection name.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the token collection symbol.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}