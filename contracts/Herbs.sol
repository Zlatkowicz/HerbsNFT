// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

import './ERC721Connector.sol';

contract Herbs is ERC721Connector {
    
    constructor() ERC721Connector('Herbs', 'HERB') {
        
    } 
}