// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;


interface IERC721 {
    event Transfer (
        address indexed form, 
        address indexed to, 
        uint256 indexed tokenId
    );

    event Approval(
        address indexed _owner,
        address indexed _approved,
        uint256 indexed _tokenId
    );

    function balanceOf(address _owner) external view returns(uint256);
    function ownerOf(uint256 _tokenId) external view returns(address);
    function transferFrom(address _from, address _to, uint256 _tokenId) external;
}