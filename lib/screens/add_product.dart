import 'package:flutter/material.dart';
import '../widgets/left_drawer.dart';

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
  String _category = "jersey";
  bool _isFeatured = false;
  int _stock = 0;
  String _brand = "";
  double _rating = 0.0;

  final List<Map<String, String>> _categories = [
    {'value': 'jersey', 'label': 'Jersey'},
    {'value': 'sepatu', 'label': 'Sepatu'},
    {'value': 'bola', 'label': 'Bola'},
    {'value': 'aksesoris', 'label': 'Aksesoris'},
    {'value': 'random', 'label': 'Random'},
  ];

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
              // NAMA
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

              // HARGA
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

              // DESKRIPSI
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

              // URL THUMBNAIL
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

              // KATEGORI (Dropdown)
              DropdownButtonFormField<String>(
                value: _category,
                items: _categories.map((cat) {
                  return DropdownMenuItem(
                    value: cat['value'],
                    child: Text(cat['label']!),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _category = value!),
                decoration: const InputDecoration(labelText: "Kategori"),
              ),
              const SizedBox(height: 12),

              // IS FEATURED (Checkbox)
              CheckboxListTile(
                title: const Text("Tampilkan di Beranda (Featured)"),
                value: _isFeatured,
                onChanged: (value) => setState(() => _isFeatured = value ?? false),
              ),
              const SizedBox(height: 12),

              // STOCK
              TextFormField(
                decoration: const InputDecoration(labelText: "Stok Produk"),
                keyboardType: TextInputType.number,
                onChanged: (value) => _stock = int.tryParse(value) ?? 0,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Stok wajib diisi!";
                  final number = int.tryParse(value);
                  if (number == null || number < 0) return "Stok harus angka >= 0!";
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // BRAND
              TextFormField(
                decoration: const InputDecoration(labelText: "Brand (Opsional)"),
                onChanged: (value) => _brand = value,
              ),
              const SizedBox(height: 12),

              // RATING
              TextFormField(
                decoration: const InputDecoration(labelText: "Rating (0.0 - 5.0)"),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onChanged: (value) => _rating = double.tryParse(value) ?? 0.0,
                validator: (value) {
                  if (value == null || value.isEmpty) return "Rating wajib diisi!";
                  final number = double.tryParse(value);
                  if (number == null || number < 0 || number > 5) return "Rating harus antara 0 dan 5!";
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // BUTTON SAVE
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
                            Text("Featured: $_isFeatured"),
                            Text("Stok: $_stock"),
                            Text("Brand: $_brand"),
                            Text("Rating: $_rating"),
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
                child: const Text("Simpan Produk"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
