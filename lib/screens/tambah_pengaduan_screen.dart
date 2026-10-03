import 'package:flutter/material.dart';

import '../models/kategori_pengaduan.dart';
import '../models/pengaduan.dart';

class TambahPengaduanScreen extends StatefulWidget {
  const TambahPengaduanScreen({super.key});

  @override
  State<TambahPengaduanScreen> createState() =>
      _TambahPengaduanScreenState();
}

class _TambahPengaduanScreenState extends State<TambahPengaduanScreen> {
  final _formKey = GlobalKey<FormState>();

  final _judulController = TextEditingController();
  final _deskripsiController = TextEditingController();

  KategoriPengaduan? _kategoriDipilih;

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Pengaduan'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(
                  labelText: 'Judul Pengaduan',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Judul pengaduan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deskripsiController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Pengaduan',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Deskripsi pengaduan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<KategoriPengaduan>(
                initialValue: _kategoriDipilih,
                decoration: const InputDecoration(
                  labelText: 'Kategori Pengaduan',
                  border: OutlineInputBorder(),
                ),
                items: KategoriPengaduan.values.map((kategori) {
                  return DropdownMenuItem(
                    value: kategori,
                    child: Text(kategori.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _kategoriDipilih = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Kategori pengaduan harus dipilih';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final pengaduanBaru = Pengaduan(
                        id: 'PG${DateTime.now().millisecondsSinceEpoch}',
                        judul: _judulController.text.trim(),
                        deskripsi: _deskripsiController.text.trim(),
                        kategori: _kategoriDipilih!,
                        tanggalDibuat: DateTime.now(),
                      );

                      Navigator.pop(context, pengaduanBaru);
                    }
                  },
                  child: const Text('Simpan Pengaduan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}