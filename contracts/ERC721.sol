// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

import './Interfaces/IERC721.sol';
import './libraries/Counters.sol';
import './ERC165.sol';

contract ERC721 is ERC165, IERC721 {
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    
    mapping(uint256 => address) private _tokenOwner;

    mapping(address => Counters.Counter) private _ownedTokensCount;

    mapping(uint256 => address) private _tokenApprovals;

    constructor() {
        _registerInterface(bytes4(keccak256('balanceOf(bytes4)')^
        keccak256('ownerOf(bytes4)')^
        keccak256('transferFrom(bytes4)')));
    }

    function balanceOf(address _owner) public override view returns(uint256) {
        require(_owner != address(0), "Address is zero");
        return _ownedTokensCount[_owner].current();
    }
    function ownerOf(uint256 _tokenId) public override view returns(address) {
        address owner = _tokenOwner[_tokenId]; 
        require(owner != address(0), "Address is zero");
        return owner;
    }

    function _exists(uint256 tokenId) internal view returns(bool) {
        address owner =  _tokenOwner[tokenId];
        return owner != address(0);
    }
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721 minting to zero address");
        
        //Revisar que el token ya no exista una vez minteado
        require(!_exists(tokenId), 'ERC721 already exists');
        
        // Mapping de tokenid con direccion
        _tokenOwner[tokenId] = to;

        // Cuantos tokens tiene 
        _ownedTokensCount[to].increment();
        
        emit Transfer(address(0), to, tokenId);
    }

    function _transferFrom(address _from, address _to, uint256 _tokenId) internal {
        require(_to != address(0), 'ERROR - ERC721 transfer to the zero address');
        require(ownerOf(_tokenId) == _from, 'Trying to transfer a token the address does not own!');
        _ownedTokensCount[_from].decrement();
        _ownedTokensCount[_to].increment();
        _tokenOwner[_tokenId] = _to;
        emit Transfer(_from, _to, _tokenId);
    }

    function transferFrom(address _from, address _to, uint256 _tokenId) public override {
        require(isApprovedOrOwner(msg.sender, _tokenId));
        _transferFrom(_from, _to, _tokenId);
    }

    function approve(address _to, uint256 tokenId) public {
        address owner = ownerOf(tokenId);
        require(_to != owner, 'ERROR - approval to current owner');
        require(msg.sender == owner, 'Current caller must be owner');
        _tokenApprovals[tokenId] = _to;
        emit Approval(owner, _to, tokenId);
    }

    function isApprovedOrOwner(address spender, uint256 tokenId) internal view returns(bool) {
        require(_exists(tokenId), 'Tokens does not exist');
        address owner = ownerOf(tokenId);
        return(spender == owner);
    }
}