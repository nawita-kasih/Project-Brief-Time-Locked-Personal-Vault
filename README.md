# PersonalVault Smart Contract

Smart contract ini diimplementasikan di jaringan Ethereum Sepolia Testnet. Kontrak ini berfungsi sebagai "brankas" digital yang mengunci aset ETH sampai batas waktu tertentu.

## Spesifikasi Kontrak
* **Kontrak**: PersonalVault
* **Jaringan**: Ethereum Sepolia Testnet
* **Alamat Kontrak**: [Ganti dengan alamat 0x... yang muncul di Remix]

## Fitur
1. **Deposit**: Mengirim ETH ke dalam kontrak.
2. **Withdraw**: Penarikan dana hanya bisa dilakukan oleh pemilik setelah `unlockTime` terlewati.
3. **Extend Lock**: Pemilik dapat memperpanjang waktu penguncian.

## Cara Interaksi
- Pastikan MetaMask terhubung ke jaringan **Sepolia**.
- Pastikan saldo SepoliaETH tersedia untuk biaya gas.
- Gunakan fungsi `deposit` untuk menyimpan aset.
- Fungsi `withdraw` akan me-revert transaksi jika waktu saat ini kurang dari `unlockTime`.
