# ☕ Smart Cafe Management - Backend & Database Manager

Repositori ini berisi seluruh kode sumber (*source code*) Java untuk manajemen data, koneksi database, serta struktur basis data MySQL yang digunakan dalam proyek **Smart Cafe Management**. 

Bagian ini difokuskan pada pemrosesan logika data (*Backend*) sebelum diintegrasikan dengan tampilan antarmuka (*GUI*).

---

## 🛠️ Komponen Sistem
* **Bahasa Pemrograman:** Java (JDK 21)
* **Sistem Manajemen Database:** MySQL (via XAMPP)
* **Driver Konektor:** MySQL Connector/J `8.4.0` atau `9.7.0`
* **IDE Development:** NetBeans

---

## 📂 Struktur File Utama
* `/src` : Berisi seluruh file `.java` untuk konfigurasi koneksi database, kelas model, dan fungsi operasi CRUD (Create, Read, Update, Delete).
* `smart_cafe_db.sql` : Berkas rancangan basis data lengkap yang siap di-import ke phpMyAdmin.

---

## 🚀 Panduan Penggunaan & Integrasi Kelompok

Bagi anggota tim yang bertugas membuat **GUI/Frontend**, ikuti langkah berikut untuk menghubungkan tampilan Anda dengan backend database ini:

### 1. Pengaturan Database (XAMPP)
1. Aktifkan modul **Apache** dan **MySQL** pada XAMPP Control Panel.
2. Buka browser dan akses `http://localhost/phpmyadmin/`.
3. Buat database baru dengan nama: `smart_cafe_db`.
4. Pilih database tersebut, masuk ke menu **Import**, lalu pilih file `smart_cafe_db.sql` yang ada di repositori ini. Klik **Go/Import**.

### 2. Konfigurasi di NetBeans Teman Kelompok
1. Salin folder package atau file `.java` dari folder `/src` repositori ini ke dalam proyek NetBeans Anda.
2. Pastikan Anda telah menambahkan **MySQL Connector .jar** di bagian *Project Properties > Libraries > Classpath*.
3. Jika Anda menggunakan versi driver yang berbeda (misalnya versi 9.7.0), hapus referensi *library* lama yang *broken/missing*, lalu masukkan file `.jar` milik Anda yang baru.

### 3. Informasi Kredensial Koneksi
Secara bawaan, kode di dalam proyek ini menggunakan pengaturan default XAMPP:
* **URL:** `jdbc:mysql://localhost:3306/[NAMA_DATABASE_KAMU]`
* **Driver Class:** `com.mysql.cj.jdbc.Driver`
* **Username:** `root`
* **Password:** `""` (Kosong)
