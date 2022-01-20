// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC721Connector.sol";

contract Kryptobird is ERC721Connector {
    // set array nft untuk di mint 
    string[] public Kryptobirdz;

    //set mapping untuk track apakah nft sudah di mapping atau tidak ;
    mapping(string=>bool) _kriptoBirdzExists;


    string private name="Krytobird";
    string private symbol="KRZ";

    function mint (string memory _kryptoBird ) public {
        // sebelum jalan kan mint maka harus cek apakah krypto sudah dimint atau belm 
        require(!_kriptoBirdzExists[_kryptoBird],"Error - krytpobirz already exist");

       Kryptobirdz.push(_kryptoBird); 
        uint _id =Kryptobirdz.length - 1;
        // memanggil function yang ada di Connector yang sudah dihubungkan dengan ERC721.
        _mint(msg.sender, _id);

        //setiap mint nft maka harus set mapping true ke mapping _kriptoBirdzExists 
        _kriptoBirdzExists[_kryptoBird]=true;
    }

    constructor() ERC721Connector(name, symbol) {}
}
