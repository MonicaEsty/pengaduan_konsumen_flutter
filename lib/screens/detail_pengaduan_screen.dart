import 'package:flutter/material.dart';

import '../models/pengaduan.dart';

class DetailPengaduanScreen extends StatelessWidget {
  final Pengaduan pengaduan;

  const DetailPengaduanScreen({
    super.key,
    required this.pengaduan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengaduan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pengaduan.judul,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              pengaduan.deskripsi,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Kategori: ${pengaduan.kategori.name}',
            ),
            const SizedBox(height: 8),
            Text(
              'Status: ${pengaduan.status.name}',
            ),
            const SizedBox(height: 8),
            Text(
              'Tanggal dibuat: '
              '${pengaduan.tanggalDibuat.day}/'
              '${pengaduan.tanggalDibuat.month}/'
              '${pengaduan.tanggalDibuat.year}',
            ),
          ],
        ),
      ),
    );
  }
}