import 'kategori_pengaduan.dart';
import 'status_pengaduan.dart';

class Pengaduan {
  final String id;
  final String judul;
  final String deskripsi;
  final KategoriPengaduan kategori;
  final StatusPengaduan status;
  final DateTime tanggalDibuat;

  Pengaduan({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.kategori,
    this.status = StatusPengaduan.baru,
    required this.tanggalDibuat,
  });
}