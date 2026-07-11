// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PersonalVault {
    // Program menyimpan alamat pemilik dan batas waktu pencairan.
    address public owner;
    uint256 public unlockTime;
    
    // Program menyiapkan kejadian untuk mencatat aktivitas penting.
    event Deposit(address indexed sender, uint256 amount);
    event Withdrawal(uint256 amount, uint256 timestamp);
    event LockExtended(uint256 newUnlockTime);
    
    // Program menyiapkan pesan kesalahan kustom untuk menghemat gas.
    error FundsLocked();
    error NotOwner();
    error InvalidUnlockTime();
    
    // Fungsi pembatas ini memblokir pihak selain pemilik kontrak.
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }
    
    // Fungsi konstruktor ini berjalan satu kali saat Anda melakukan deploy.
    // Program memvalidasi waktu buka kunci agar selalu berada di masa depan.
    constructor(uint256 _unlockTime) payable {
        require(_unlockTime > block.timestamp, "Unlock time must be in the future");
        owner = msg.sender;
        unlockTime = _unlockTime;
    }
    
    // Fungsi ini menerima setoran koin dari pengguna.
    // Program memicu kejadian Deposit setelah saldo bertambah.
    function deposit() public payable {
        emit Deposit(msg.sender, msg.value);
    }
    
    // Fungsi ini menarik seluruh dana kembali ke dompet pemilik.
    // Program memblokir penarikan jika batas waktu belum terlewati.
    function withdraw() public onlyOwner {
        if (block.timestamp < unlockTime) revert FundsLocked();
        
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds available");
        
        // Program menggunakan metode call untuk mengirim ETH secara aman.
        (bool success, ) = owner.call{value: balance}("");
        require(success, "Transfer failed");
        
        emit Withdrawal(balance, block.timestamp);
    }
    
    // Fungsi ini memperpanjang durasi kunci kontrak.
    // Program menolak pembaruan jika waktu baru lebih singkat dari waktu lama.
    function extendLock(uint256 _newTime) public onlyOwner {
        if (_newTime <= unlockTime) revert InvalidUnlockTime();
        unlockTime = _newTime;
        
        emit LockExtended(_newTime);
    }
}