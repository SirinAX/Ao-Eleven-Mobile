import 'package:flutter/material.dart';
import 'left_drawer.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  String _thumbnail = "";
  String _category = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Produk Baru"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Nama Produk"),
                onChanged: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Nama tidak boleh kosong!";
                  if (value.length < 3) return "Nama minimal 3 karakter!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(labelText: "Harga"),
                keyboardType: TextInputType.number,
                onChanged: (value) => _price = int.tryParse(value) ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Harga tidak boleh kosong!";
                  final number = int.tryParse(value);
                  if (number == null) return "Harga harus berupa angka!";
                  if (number <= 0) return "Harga harus lebih dari 0!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(labelText: "Deskripsi"),
                onChanged: (value) => _description = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Deskripsi wajib diisi!";
                  if (value.length < 10) return "Deskripsi minimal 10 karakter!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(labelText: "URL Thumbnail"),
                onChanged: (value) => _thumbnail = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "URL wajib diisi!";
                  final regex = RegExp(r'^https?:\/\/.*\.(jpg|jpeg|png)$');
                  if (!regex.hasMatch(value)) return "URL harus valid dan berakhiran jpg/png!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              TextFormField(
                decoration: const InputDecoration(labelText: "Kategori"),
                onChanged: (value) => _category = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Kategori wajib diisi!";
                  return null;
                },
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Produk Berhasil Ditambahkan!"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama: $_name"),
                            Text("Harga: $_price"),
                            Text("Deskripsi: $_description"),
                            Text("Thumbnail: $_thumbnail"),
                            Text("Kategori: $_category"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
