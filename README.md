# Pengaduan Konsumen Flutter

Aplikasi **Pengaduan Konsumen** merupakan mini app Flutter yang digunakan untuk mencatat dan melihat data pengaduan konsumen. Data pada aplikasi masih disimpan secara in-memory sehingga data akan kembali ke kondisi awal ketika aplikasi dijalankan ulang.

Aplikasi memiliki tiga layar utama, yaitu **Daftar Pengaduan**, **Detail Pengaduan**, dan **Tambah Pengaduan**. Pada halaman daftar, data pengaduan ditampilkan menggunakan `ListView.builder` dan custom widget `PengaduanCard`. Pengguna dapat memilih salah satu pengaduan untuk melihat detail atau menekan tombol tambah untuk membuat pengaduan baru.

Form tambah pengaduan memiliki input judul, deskripsi, dan kategori. Form menggunakan validasi sehingga data tidak dapat disimpan apabila input masih kosong. Setelah data valid dan disimpan, objek pengaduan baru dikembalikan ke halaman daftar dan ditambahkan menggunakan `setState()` sehingga perubahan langsung terlihat pada tampilan.

## Bug yang Ditemui

Salah satu bug yang sempat membuat saya stuck terjadi pada halaman `DetailPengaduanScreen`. Awalnya saya menggunakan `const Padding`, tetapi di dalam widget tersebut terdapat data yang berasal dari objek `pengaduan`, seperti `pengaduan.judul` dan `pengaduan.deskripsi`. Hal tersebut menyebabkan error karena nilai tersebut bukan nilai konstan.

Saya mengetahui penyebabnya setelah melihat pesan error pada editor dan memeriksa kembali penggunaan `const`. Solusinya adalah menghapus `const` pada `Padding` yang berisi data dinamis, tetapi tetap menggunakan `const` pada widget yang nilainya memang tetap, seperti `SizedBox` dan `TextStyle`.

## Pemeriksaan

Project telah diperiksa menggunakan:

```bash
flutter analyze