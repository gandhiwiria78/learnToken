// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './ERC721Metadata.sol';
import './ERC721.sol';

contract ERC721Connector is ERC721metadata, ERC721 {

     // menghubungkan func constructor connector dan metadata . 
     constructor(string memory name , string memory symbol) ERC721metadata(name,symbol){

     }
}