// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

interface IERC721Metadata {

    function name() external view returns (string memory _name);

    function symbol() external view returns (string memory _symbol);

    // function tokenURI(uint256 _tokenId) external view returns (string memory);
}