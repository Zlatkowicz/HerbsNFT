// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

import './ERC721Connector.sol';

contract Herbs is ERC721Connector {
    
    // Matriz para guardar los nfts
    string[] public HerbsNFTS;

    mapping(string => bool) _herbsNFTExists;

    function mint(string memory _herbs) public {

        require(!_herbsNFTExists[_herbs], "ERROR - Token already Exists");

        HerbsNFTS.push(_herbs);
        uint _id = HerbsNFTS.length -1;

        _mint(msg.sender, _id);
        _herbsNFTExists[_herbs] = true;
    }
    
    constructor() ERC721Connector('Herbs', 'HERB') {
        
    } 
}