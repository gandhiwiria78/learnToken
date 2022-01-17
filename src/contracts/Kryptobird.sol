// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC721Connector.sol";

contract Kryptobird is ERC721Connector {
    string private name = "Kryptobird";
    string private symbol = "KBIRDZ";

    constructor() ERC721Connector(name, symbol) {}
}
