// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

import './ERC721Metadata.sol';
import './ERC721.sol';

contract ERC721Connector is ERC721Metadata, ERC721 {

    /* Seteamos el connector entre los metadatos y el contrato principal*/
    constructor(
        string memory name, 
        string memory symbol) 
        ERC721Metadata(name, symbol)
        {

    }
}