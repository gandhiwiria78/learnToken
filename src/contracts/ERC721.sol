// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// membuat function standar ERC721 (kewajiban untuk ERC721)
contract ERC721{
    /* Tugas 
        1. mengarahkan NTF ke owner 
        2. mendapatkan track token ids
        3. track alamat owner ke token ids 
        4. memakai fungsi event - dan lalu emits transfer log 
    */

    // event yang disediakan oleh ERC721 untuk transfer  
    event Transfer(
        address indexed from , 
        address indexed to , 
        uint256 indexed tokenID
    );

    // mapping dari token id ke owner
    mapping(uint256=>address) private _tokenOwner;

    // Mapping dari owner jumlah token 
    mapping(address=> uint256) private _OwnerTokenCount;

    function _exist(uint256 tokenID) internal view returns(bool){
        address owner =_tokenOwner[tokenID]; 
        return owner != address(0);
    }

    function _mint (address to , uint256 tokenID) internal {
        // cek address kosong 
        require(to!=address(0),'ERC721 : minting error [zero address]');

        // cek token tidak ada 
        require(!_exist(tokenID),'ERC721:token Already minted');

        //set tokenowner ke address tujuan dan menamabahkan token +1 
        _tokenOwner[tokenID]= to;
        _OwnerTokenCount[to] +=1;

        emit Transfer(address(0), to, tokenID);
    }
}