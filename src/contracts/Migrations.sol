// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
  address public owner = msg.sender;
  uint public last_completed_migration;

/*
  memodifikasi function , konsepnya sebelum memanggil function maka 
  harus cek require pada funcition modifer baru setelah itu function berikutnya akan dipanggil kembali
*/
  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
    /*
    _; shortcut code untuk melanjutkan ke function berikutnya yaitu function setCompleted();
    */
  }


  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed;
  }

  // untuk mengupgrade kontrak , Dengan address yang baru 
  function upgrade(address new_address) public restricted {
    Migrations upgraded= Migrations(new_address); //membuat variable dengan kontrak ini sendiri dan menyimpanan new address 
    upgraded.setCompleted(last_completed_migration); // set kembali set completed kembali untuk cek sender == owner
    
  }
}
