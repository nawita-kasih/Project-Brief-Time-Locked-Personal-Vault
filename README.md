# PersonalVault Smart Contract

Smart contract ini berfungsi sebagai "brankas" digital di jaringan Ethereum Sepolia Testnet yang mengunci aset ETH sampai batas waktu tertentu.

## Informasi Deployment
* **Network**: Ethereum Sepolia Testnet
* **Contract Address**: 0x29eceb9175c9a5466faea243d539386527576bbb
* **Deployer Account**: 0x29eceb9175c9a5466faea243d539386527576bbb

## Verifikasi Kontrak & Transaksi
* **Etherscan Verification Link**: https://sepolia.etherscan.io/tx/0xe99df4e82becf43be54dc480ca78c1d2dcf10664241e7035c3312635648a722a
* **Transaction Hash (Deployment)**: 0xe99df4e82becf43be54dc480ca78c1d2dcf10664241e7035c3312635648a722a
* **Test Transaction Hash (Deposit)**: 0x5caa7fe96138944a4527df245a9e2311e31f0835848705cb893e6f0ee1b676ac

## Fitur Utama
1. **Deposit**: Mengirim ETH ke dalam kontrak dan mencatat `Deposit` event.
2. **Withdraw**: Hanya bisa dipanggil oleh `owner` setelah `unlockTime` terlewati.
3. **Extend Lock**: Memungkinkan `owner` untuk menambah durasi `unlockTime`.

## Struktur Kode
- **Constructor**: Memvalidasi bahwa `_unlockTime` harus di masa depan.
- **Modifiers**: `onlyOwner` membatasi akses fungsi sensitif.
- **Error Handling**: Menggunakan `custom errors` (NotOwner, FundsLocked, InvalidUnlockTime) untuk efisiensi gas.

## Cara Interaksi
1. Pastikan MetaMask terhubung ke jaringan **Sepolia**.
2. Masukkan alamat kontrak ke Remix IDE "At Address".
3. Lakukan pengujian menggunakan fungsi `deposit` dan `withdraw`.
