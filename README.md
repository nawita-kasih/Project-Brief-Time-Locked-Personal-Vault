# Time-Locked Personal Vault (PersonalVault)
Personal Vault adalah kontrak pintar Ethereum yang dirancang untuk menyimpan aset kripto dengan sistem kunci waktu (*time-lock*). Kontrak ini memungkinkan pengguna untuk mengunci saldo ETH mereka dan mencegah penarikan impulsif sebelum batas waktu yang ditentukan tercapai.

## Informasi Deployment
* **Network**: Ethereum Sepolia Testnet
* **Contract Address**: `0x29eceb9175c9a5466faea243d539386527576bbb`
* **Deployer Account**: `0x29eceb9175c9a5466faea243d539386527576bbb`
* **Etherscan Verification Link**: (https://sepolia.etherscan.io/address/0x29eceb9175c9a5466faea243d539386527576bbb)

## Transaksi Uji Coba
* **Deployment Hash**: `0xe99df4e82becf43be54dc480ca78c1d2dcf10664241e7035c3312635648a722a`
* **Deposit Hash**: `0x5caa7fe96138944a4527df245a9e2311e31f0835848705cb893e6f0ee1b676ac`

## Fitur Utama
* **Deposit Bebas**: Pemilik dapat menyetor ETH ke dalam kontrak kapan saja tanpa batasan jumlah.
* **Kunci Waktu Ketat**: Sistem memblokir semua upaya penarikan sebelum batas waktu pencairan (*unlockTime*) terlewati.
* **Perpanjangan Durasi**: Pemilik dapat memperpanjang waktu kunci. Sistem menolak pemendekan waktu kunci demi alasan keamanan.
* **Akses Eksklusif**: Hanya alamat dompet pemilik (*owner*) yang memiliki hak akses untuk menarik dana.

## Spesifikasi Teknis
* **Bahasa Pemrograman**: Solidity ^0.8.20
* **Keamanan**: Implementasi `modifiers` (onlyOwner) dan `custom errors` (NotOwner, FundsLocked, InvalidUnlockTime) untuk efisiensi gas.
* **Fungsi Utama**: 
    - `deposit()`: Mengirim ETH dan mencatat `Deposit` event.
    - `withdraw()`: Menarik dana jika kondisi waktu terpenuhi.
    - `extendLock()`: Memperpanjang batas waktu kunci.

## Struktur Kode
- **Constructor**: Memvalidasi bahwa `_unlockTime` harus berada di masa depan.
- **Modifiers**: `onlyOwner` membatasi akses ke fungsi sensitif (withdraw & extendLock).
- **Error Handling**: Menggunakan pesan kesalahan kustom untuk memberikan informasi kegagalan yang akurat dan hemat biaya gas.

## Cara Penggunaan
1. Pastikan MetaMask terhubung ke jaringan **Sepolia Testnet**.
2. Masukkan alamat kontrak di atas ke dalam Remix IDE (fitur "At Address") jika ingin berinteraksi ulang.
3. Gunakan fungsi `deposit` dengan nilai (value) yang diinginkan.
4. Gunakan fungsi `withdraw` untuk menarik dana (hanya berhasil jika waktu saat ini > `unlockTime`).
