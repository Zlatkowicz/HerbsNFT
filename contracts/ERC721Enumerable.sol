// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

import './ERC721.sol';
import './Interfaces/IERC721Enumerable.sol';

contract ERC721Enumerable is IERC721Enumerable, ERC721 {
    uint256[] private _allTokens;

    mapping(uint256 => uint256) private _allTokensIndex;
    mapping(address => uint256[]) private _ownedTokens;
    mapping(uint256 => uint256) private _ownedTokensIndex;

    /* function tokenByIndex(uint256 _index) external view returns(uint256) {}

    function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns(uint256){} */

    function _mint(address to, uint256 tokenId) override(ERC721) internal {
        super._mint(to, tokenId);
        _addTokensToOwnerEnumeration(to, tokenId);
        _addTokensToAllTokenEnumeration(tokenId);
    }

    function _addTokensToAllTokenEnumeration(uint256 tokenId) private {
        _allTokensIndex[tokenId] = _allTokens.length;
        _allTokens.push(tokenId);
    }

    function _addTokensToOwnerEnumeration(address to, uint256 tokenId) private {
        _ownedTokensIndex[tokenId] = _ownedTokens[to].length;
        _ownedTokens[to].push(tokenId);
    }


    function tokenByIndex(uint256 index) public override view returns(uint256) {
        require(index < totalSupply(), "Index out of bounds");
        return _allTokens[index];
    }

    function tokenOfOwnerByIndex(address owner, uint256 index) public override view returns(uint256) {
        require(index < balanceOf(owner), "Owner Index out of bounds");
        return _ownedTokens[owner][index];
    }
    function totalSupply() public override view returns(uint256) {
        return _allTokens.length;
    }
}