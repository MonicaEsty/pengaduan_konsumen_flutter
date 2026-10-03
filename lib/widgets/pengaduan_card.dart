import 'package:flutter/material.dart';

import '../models/pengaduan.dart';

class PengaduanCard extends StatelessWidget {
  final Pengaduan pengaduan;
  final VoidCallback onTap;

  const PengaduanCard({
    super.key,
    required this.pengaduan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      child: ListTile(
        title: Text(
          pengaduan.judul,
        ),
        subtitle: Text(
          '${pengaduan.kategori.name} • ${pengaduan.status.name}',
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}