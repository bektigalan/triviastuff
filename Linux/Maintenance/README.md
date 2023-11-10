
1. **Memeriksa Informasi CPU:**

   ```bash
   sudo lscpu
   ```

   Command ini memberikan informasi rinci tentang CPU, termasuk model, arsitektur, jumlah inti (cores), dan lainnya.

2. **Memeriksa Penggunaan CPU:**

   ```bash
   htop
   ```

   Command ini menampilkan daftar proses yang sedang berjalan bersama dengan informasi penggunaan CPU secara real-time.

3. **Memeriksa Informasi RAM:**

   ```bash
   sudo free -h
   ```

   Command ini menampilkan informasi tentang penggunaan dan ketersediaan RAM pada sistem.

4. **Memeriksa Informasi Hard Disk:**

   ```bash
   sudo df -h
   ```

   Command ini menampilkan informasi tentang penggunaan ruang disk pada sistem, termasuk kapasitas, penggunaan, dan ketersediaan.

5. **Memeriksa Kesehatan Hard Disk (S.M.A.R.T.):**

   ```bash
   sudo smartctl -a /dev/sdX
   ```

   Gantilah `/dev/sdX` dengan perangkat blok yang sesuai (seperti `/dev/sda`). Command ini memberikan informasi kesehatan hard disk menggunakan fitur S.M.A.R.T.

6. **Memeriksa Informasi Partisi dan Tabel Partisi:**

   ```bash
   sudo fdisk -l
   ```

   Command ini menampilkan informasi tentang partisi yang ada pada hard disk.

7. **Memeriksa Penggunaan Inode:**

   ```bash
   sudo df -i
   ```

   Command ini menampilkan informasi tentang penggunaan inode pada sistem file.

8. **Memeriksa Informasi PCI Devices:**

   ```bash
   sudo lspci
   ```

   Command ini menampilkan informasi tentang perangkat PCI yang terhubung ke sistem.

9. **Memeriksa Informasi USB Devices:**

   ```bash
   sudo lsusb
   ```

   Command ini menampilkan informasi tentang perangkat USB yang terhubung ke sistem.
10. **Memeriksa Informasi Storage Direktori:**
    
    ```bash
    sudo du -h -s /var/www/html
    ```