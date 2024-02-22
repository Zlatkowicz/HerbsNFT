// SPDX-License-Identifier: MIT
// Author: @Zlatkowicz
pragma solidity ^0.8.18;

contract ERC721Metadata {
    string private _name;
    string private _symbol;

    constructor(string memory named, string memory symbolified) {
        _name = named;
        _symbol = symbolified;
    }

    function setName() external view returns(string memory) {
        return _name;
    }
    function setSymbol() external view returns(string memory) {
        return _symbol;
    }
}