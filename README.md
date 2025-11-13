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

## 📲 Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

---

### 📦 Mengapa Perlu Membuat Model Dart untuk Data JSON?

Saat mengambil data dari Django REST API, data biasanya berbentuk **JSON** (`Map<String, dynamic>`).

**Alasan membuat model Dart:**

1. **Validasi tipe** → Memastikan setiap field memiliki tipe data yang tepat (misal `String`, `int`, `DateTime`), menghindari error runtime.
2. **Null-safety** → Flutter/Dart bisa lebih aman karena memeriksa nilai null pada field.
3. **Maintainability** → Memudahkan developer untuk memahami struktur data, menambahkan field baru, atau mengubah tipe tanpa harus memodifikasi banyak kode.
4. **Reusable** → Model bisa digunakan untuk parsing, tampilan, atau pengiriman data kembali ke server.

**Konsekuensi kalau langsung pakai `Map<String, dynamic>`:**

* Risiko error runtime jika field tidak ada atau null.
* Lebih sulit membaca dan memelihara kode.
* Kesulitan melakukan transformasi data (misal `String` → `DateTime`) dengan konsisten.

---

### 🌐 Fungsi Package `http` vs `CookieRequest`

| Package         | Fungsi                                                                                                                                  |
| --------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| `http`          | Mengirim request HTTP standar (GET, POST, PUT, DELETE). Tidak otomatis menyimpan session/cookie.                                        |
| `CookieRequest` | Extended dari `http` dengan **penyimpanan cookie otomatis**, cocok untuk login/logout dan request autentikasi yang membutuhkan session. |

**Ringkas:**

* `http` → basic HTTP request.
* `CookieRequest` → HTTP + session management, memudahkan komunikasi Flutter ↔ Django dengan login state.

---

### 🔗 Mengapa Instance `CookieRequest` Perlu Dibagikan?

Di Flutter, **banyak widget membutuhkan akses ke session** (misal menampilkan daftar produk milik user).

Dengan `Provider` dan `context.watch<CookieRequest>()`:

* Semua widget bisa menggunakan **instance yang sama**.
* Tidak perlu membuat request baru berulang kali → konsisten dengan cookie/session.
* Mempermudah implementasi login/logout tanpa error session.

---

### ⚙️ Konfigurasi Konektivitas Flutter ↔ Django

Agar Flutter dapat berkomunikasi dengan Django:

1. **ALLOWED_HOSTS** → Tambahkan IP emulator: `10.0.2.2` (Android emulator) atau `127.0.0.1` (desktop/web).
2. **CORS** → Mengizinkan origin dari Flutter (misal `http://localhost:8000`) agar browser tidak memblokir request.
3. **SameSite & Cookie Settings** → Cookie perlu diatur agar bisa dikirim dalam request cross-site (misal `SameSite=None; Secure`).
4. **Internet Permission di AndroidManifest.xml** → Agar aplikasi bisa mengakses internet.

**Jika salah konfigurasi:**

* Flutter tidak bisa terhubung ke API.
* Login/logout gagal.
* Data tidak muncul di aplikasi.

---

### 📝 Mekanisme Pengiriman Data

1. **User input** → Mengisi form di Flutter (misal tambah produk: nama, harga, gambar).
2. **Parsing & Model** → Data diubah menjadi model Dart (`ProductEntry`) atau `Map<String, dynamic>` untuk dikirim.
3. **Request ke Django** → Menggunakan `CookieRequest.post()` atau `.get()` untuk mengirim/ambil data.
4. **Response** → Django mengirim JSON kembali.
5. **Parsing Response** → Flutter mem-parse JSON menjadi model, lalu ditampilkan di UI (ListView / Card).

---

### 🔐 Mekanisme Autentikasi

1. **Login:**

   * Flutter mengirim username & password ke endpoint Django (`/auth/login/`) menggunakan `CookieRequest.post()`.
   * Django memvalidasi dan membuat **session cookie**.
   * Flutter menyimpan cookie secara otomatis di `CookieRequest`.

2. **Register:**

   * Flutter mengirim data akun ke `/auth/register/`.
   * Django membuat user baru, mengembalikan status sukses/gagal.

3. **Logout:**

   * Flutter memanggil `/auth/logout/` → Django menghapus session.
   * Flutter membersihkan state (cookie) → pengguna kembali ke halaman login.

**Keuntungan:** cookie/session memastikan user tetap login saat berpindah halaman tanpa harus memasukkan password lagi.

---

### 🛠️ Implementasi Checklist Step-by-Step

1. Buat **model Dart** (`ProductEntry`) untuk representasi data produk.
2. Buat halaman **ProductEntryListPage** dengan `FutureBuilder` untuk menampilkan data.
3. Tambahkan **Drawer** (`LeftDrawer`) untuk navigasi antar halaman.
4. Buat halaman **AddProductPage** dengan form + validasi input.
5. Gunakan **CookieRequest** + `Provider` untuk share session ke seluruh widget.
6. Implementasikan **login, logout, register** dengan `CookieRequest`.
7. Tambahkan **AppBar button** untuk filter “My Products” vs “All Products” tanpa bikin halaman baru.
8. Gunakan **ListView & Card** untuk menampilkan daftar produk agar UI responsive.
9. Konfigurasi Django untuk **CORS, ALLOWED_HOSTS, cookie settings**, dan Android/iOS untuk izin internet.
10. Test seluruh alur: login → lihat semua produk → filter produk sendiri → tambah produk → logout.

---



