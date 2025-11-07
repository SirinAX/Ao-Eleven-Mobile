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

| Widget                           | Fungsi                                                  |
| -------------------------------- | ------------------------------------------------------- |
| `MaterialApp`                    | Menjadi root aplikasi dan mengatur tema serta navigasi  |
| `Scaffold`                       | Menyediakan struktur dasar seperti AppBar dan body      |
| `AppBar`                         | Menampilkan judul pada bagian atas aplikasi             |
| `ListView`                       | Menampilkan daftar item secara scrollable               |
| `Card`                           | Membuat tampilan item lebih rapi seperti kartu produk   |
| `Container`                      | Mengatur padding, margin, dan styling                   |
| `Text`                           | Menampilkan teks seperti nama produk, harga, dll        |
| `Image.network`                  | Menampilkan gambar produk dari internet                 |
| `Row` / `Column`                 | Mengatur tata letak widget secara horizontal / vertikal |
| `Icon` / `IconButton` (jika ada) | Menampilkan ikon yang bisa bersifat interaktif          |

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

| StatelessWidget                   | StatefulWidget                       |
| --------------------------------- | ------------------------------------ |
| Tidak memiliki state yang berubah | Memiliki state yang dinamis          |
| UI tidak berubah setelah build    | UI bisa berubah ketika state berubah |
| Contoh: teks statis, ikon         | Contoh: button counter, input field  |

📌 Pilihan:

* Kalau UI **tidak tergantung perubahan data** → Stateless
* Kalau UI **berubah sesuai interaksi / data** → Stateful

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

| Hot Reload                           | Hot Restart                                |
| ------------------------------------ | ------------------------------------------ |
| Memperbarui UI tanpa menghapus state | Merestart aplikasi dari awal               |
| Lebih cepat untuk development UI     | Digunakan saat merubah struktur kode besar |
| Cocok untuk tweak tampilan cepat     | Cocok saat terdapat bug pada state         |

---

## 📱 Tugas 8 — Flutter Navigation, Layouts, Forms, and Input Elements

Pada tugas ini, aplikasi dikembangkan lebih lanjut dengan menambahkan **navigasi antar halaman, drawer, serta form untuk menambah produk baru.**
Aplikasi kini memiliki dua halaman utama: **Halaman Utama (Home Page)** dan **Halaman Tambah Produk (Add Product Page)**.

---

### 🧭 Perbedaan `Navigator.push()` dan `Navigator.pushReplacement()`

* **`Navigator.push()`**
  Menambahkan halaman baru di atas halaman yang sedang aktif (stack navigasi). Pengguna masih dapat kembali ke halaman sebelumnya dengan tombol **back**.
  📍 Contoh penggunaan: Saat menekan tombol **Tambah Produk** dari halaman utama agar bisa kembali lagi setelah menambahkan produk.

* **`Navigator.pushReplacement()`**
  Mengganti halaman saat ini dengan halaman baru dan menghapus halaman sebelumnya dari stack. Tombol **back** tidak akan mengembalikan pengguna ke halaman sebelumnya.
  📍 Contoh penggunaan: Saat memilih menu dari **Drawer** untuk berpindah halaman, karena transisi bersifat menggantikan halaman utama.

🧩 **Kesimpulan:**
Gunakan `push()` jika ingin pengguna bisa kembali, dan `pushReplacement()` jika halaman baru sepenuhnya menggantikan halaman lama.

---

### 🏗️ Struktur Halaman dengan `Scaffold`, `AppBar`, dan `Drawer`

Setiap halaman dalam aplikasi memiliki struktur yang konsisten karena menggunakan kombinasi:

* **`Scaffold`** → Sebagai kerangka utama halaman, berisi AppBar, body, dan Drawer.
* **`AppBar`** → Menampilkan judul halaman, misalnya “Football Shop” atau “Tambah Produk”.
* **`Drawer`** → Berisi menu navigasi menuju Halaman Utama dan Tambah Produk.

Dengan pendekatan ini, setiap halaman terlihat seragam, mudah digunakan, dan memiliki navigasi yang konsisten di seluruh aplikasi.

---

### 🎨 Penggunaan `Padding`, `SingleChildScrollView`, dan `ListView` dalam Form

Widget ini digunakan untuk menjaga tampilan agar tetap rapi, nyaman, dan bisa diakses di semua ukuran layar:

* **`Padding`** → Memberi jarak antar elemen form agar tampilan lebih proporsional.
  💡 Contoh: `Padding(padding: EdgeInsets.all(16.0), child: TextField(...))`

* **`SingleChildScrollView`** → Membuat halaman form bisa di-*scroll* jika elemen terlalu banyak atau layar kecil.
  💡 Contoh: seluruh form tambah produk dibungkus dalam `SingleChildScrollView`.

* **`ListView`** → Dipakai untuk menampilkan daftar produk atau opsi di Drawer dengan kemampuan scroll otomatis.
  💡 Contoh: daftar item navigasi di LeftDrawer.

Kombinasi ketiganya membuat UI form lebih responsif dan nyaman digunakan di berbagai perangkat.

---

### 🌈 Penyesuaian Warna Tema

Agar aplikasi memiliki identitas visual yang kuat sebagai brand **Ao Eleven**, digunakan **warna biru** sebagai warna utama tema.
Warna ini diterapkan pada:

* `AppBar`
* `DrawerHeader`
* Tombol utama (seperti tombol “Save”)

Implementasi diatur melalui `ThemeData`:

```dart
theme: ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
)
```

Dengan penerapan tema yang konsisten, aplikasi memiliki tampilan profesional dan identitas visual yang mudah dikenali.

---


