# ⚽ AO-ELEVEN
```sh
Ini adalah Repositori untuk aplikasi mobile bertemakan Football Shop.
dikembangkan oleh Andi Hakim Himawan (Kelas PBP-D, Fasilkom UI).
```
---

## 🚀 Cara Menjalankan Aplikasi
```sh
flutter pub get
flutter run
```
---

## 📌 Tugas 7 — Elemen Dasar Flutter

Pada tugas ini, aplikasi dibangun menggunakan berbagai elemen dasar pada Flutter untuk menampilkan daftar produk bertema sepak bola. Aplikasi ini mengimplementasikan struktur widget tree, penggunaan Material Design, serta navigasi antar widget.

---

## ✅ Jawaban Pertanyaan

### 1️⃣ Apa itu Widget Tree dan hubungan Parent-Child?
Widget tree adalah struktur hirarki yang menyusun UI di Flutter.  
Setiap widget memiliki **parent (induk)** dan **child (anak)**.  
Parent akan bertanggung jawab mengatur layout, gaya, serta posisi dari child-nya.  
Dengan konsep ini, Flutter dapat melakukan efisiensi render dan pembaruan tampilan secara optimal.

---

### 2️⃣ Widget yang digunakan dan fungsinya
| Widget | Fungsi |
|--------|--------|
| `MaterialApp` | Menjadi root aplikasi dan mengatur tema serta navigasi |
| `Scaffold` | Menyediakan struktur dasar seperti AppBar dan body |
| `AppBar` | Menampilkan judul pada bagian atas aplikasi |
| `ListView` | Menampilkan daftar item secara scrollable |
| `Card` | Membuat tampilan item lebih rapi seperti kartu produk |
| `Container` | Mengatur padding, margin, dan styling |
| `Text` | Menampilkan teks seperti nama produk, harga, dll |
| `Image.network` | Menampilkan gambar produk dari internet |
| `Row` / `Column` | Mengatur tata letak widget secara horizontal / vertikal |
| `Icon` / `IconButton` (jika ada) | Menampilkan ikon yang bisa bersifat interaktif |

---

### 3️⃣ Fungsi `MaterialApp` dan mengapa digunakan sebagai root
`MaterialApp` menyediakan fitur inti Material Design:

✨ Tema dan warna aplikasi  
✨ Navigasi & routing  
✨ Title app  
✨ Text direction & localization

Karena menyediakan struktur dasar aplikasi, `MaterialApp` **umumnya digunakan sebagai root widget**.

---

### 4️⃣ StatelessWidget vs StatefulWidget

| StatelessWidget | StatefulWidget |
|----------------|----------------|
| Tidak memiliki state yang berubah | Memiliki state yang dinamis |
| UI tidak berubah setelah build | UI bisa berubah ketika state berubah |
| Contoh: teks statis, ikon | Contoh: button counter, input field |

📌 Pilihan:  
- Kalau UI **tidak tergantung perubahan data** → Stateless  
- Kalau UI **berubah sesuai interaksi / data** → Stateful

---

### 5️⃣ Apa itu BuildContext?
BuildContext adalah objek yang merepresentasikan **posisi widget dalam widget tree**.  
Digunakan untuk:

✔ Mengakses parent widget  
✔ Mengambil tema (Theme.of(context))  
✔ Navigasi (Navigator.of(context))  

Biasanya digunakan dalam `build(BuildContext context)`.

---

### 6️⃣ Hot Reload vs Hot Restart

| Hot Reload | Hot Restart |
|-----------|-------------|
| Memperbarui UI tanpa menghapus state | Merestart aplikasi dari awal |
| Lebih cepat untuk development UI | Digunakan saat merubah struktur kode besar |
| Cocok untuk tweak tampilan cepat | Cocok saat terdapat bug pada state |

---

