// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// membuat metadata standar ERC721 (kewajiban untuk ERC721 )
contract ERC721metadata {
     string private _name;
     string private _symbol;

     constructor(string memory named, string memory symboled){
          _name = named;
          _symbol = symboled;
     }

     function name() external view returns(string memory){
          return _name;
     }
     function symbol() external view returns(string memory){
          return _symbol;
     }

}