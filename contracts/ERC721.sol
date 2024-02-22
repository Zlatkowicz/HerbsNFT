// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

contract ERC721 {

    event Transfer (
        address indexed form, 
        address indexed to, 
        uint256 indexed tokenId
    );

    mapping(uint256 => address) private _tokenOwner;

    mapping(address => uint256) private _ownedTokensCount;

    function _exists(uint256 tokenId) internal view returns(bool) {
        address owner =  _tokenOwner[tokenId];
        return owner != address(0);
    }
    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "ERC721 minting to zero address");
        
        //Revisar que el token ya no exista una vez minteado
        require(!_exists(tokenId), 'ERC721 already exists');
        
        // Mapping de tokenid con direccion
        _tokenOwner[tokenId] = to;

        // Cuantos tokens tiene 
        _ownedTokensCount[to] += 1;
        
        emit Transfer(address(0), to, tokenId);
    }
}