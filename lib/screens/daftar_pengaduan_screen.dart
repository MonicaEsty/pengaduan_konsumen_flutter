import 'package:flutter/material.dart';

import '../models/kategori_pengaduan.dart';
import '../models/pengaduan.dart';
import '../widgets/pengaduan_card.dart';
import 'detail_pengaduan_screen.dart';
import 'tambah_pengaduan_screen.dart';

class DaftarPengaduanScreen extends StatefulWidget {
  const DaftarPengaduanScreen({super.key});

  @override
  State<DaftarPengaduanScreen> createState() =>
      _DaftarPengaduanScreenState();
}

class _DaftarPengaduanScreenState extends State<DaftarPengaduanScreen> {
  final List<Pengaduan> daftarPengaduan = [
    Pengaduan(
      id: 'PG001',
      judul: 'Transaksi Tidak Dikenal',
      deskripsi: 'Terdapat transaksi yang tidak saya lakukan.',
      kategori: KategoriPengaduan.transaksi,
      tanggalDibuat: DateTime.now(),
    ),
    Pengaduan(
      id: 'PG002',
      judul: 'Layanan Lambat',
      deskripsi: 'Proses layanan membutuhkan waktu terlalu lama.',
      kategori: KategoriPengaduan.layanan,
      tanggalDibuat: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pengaduan'),
      ),
      body: ListView.builder(
        itemCount: daftarPengaduan.length,
        itemBuilder: (context, index) {
          final pengaduan = daftarPengaduan[index];

          return PengaduanCard(
            pengaduan: pengaduan,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPengaduanScreen(
                    pengaduan: pengaduan,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final pengaduanBaru = await Navigator.push<Pengaduan>(
            context,
            MaterialPageRoute(
              builder: (context) => const TambahPengaduanScreen(),
            ),
          );

          if (pengaduanBaru != null) {
            setState(() {
              daftarPengaduan.add(pengaduanBaru);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}