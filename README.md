# BMR Calculator App

## Anggota Kelompok

| Nama                   | NIM      |
| ---------------------- | -------- |
| Maulana Albar Cassano  | K3524057 |
| Muhammad Rafly Caesario | K3524079 |

Tugas mata kuliah **Pemrograman Perangkat Bergerak** (Semester 5) — Universitas Sebelas Maret.

## Deskripsi

Aplikasi mobile berbasis **Flutter** untuk menghitung **BMR (Basal Metabolic Rate)**, yaitu jumlah kalori yang dibakar tubuh saat istirahat total. Aplikasi ini dikembangkan dari project *BMI Calculator* pada materi kuliah, dengan referensi fitur dari [calculator.net/bmr-calculator.html](https://www.calculator.net/bmr-calculator.html).

### Fitur

- Input **gender**, **tinggi badan** (slider 120–220 cm), **berat badan** (kg), dan **usia** (tahun).
- Pilihan rumus perhitungan:
  - **Mifflin-St Jeor** (default)
    - Pria: `BMR = 10W + 6.25H − 5A + 5`
    - Wanita: `BMR = 10W + 6.25H − 5A − 161`
  - **Revised Harris-Benedict**
    - Pria: `BMR = 88.362 + 13.397W + 4.799H − 5.677A`
    - Wanita: `BMR = 447.593 + 9.247W + 3.098H − 4.330A`

  (W = berat kg, H = tinggi cm, A = usia tahun)
- Hasil BMR dalam **kalori/hari**.
- **Kebutuhan kalori harian** berdasarkan tingkat aktivitas (BMR × pengali): Sedentary 1.2, Light 1.375, Moderate 1.55, Active 1.725, Very active 1.9.

### Konsep Flutter yang dipakai

OOP, Custom Widget, Theme, StatefulWidget/`setState`, enum, fungsi sebagai parameter (callback), dan pengiriman data antar halaman (`Navigator.push` + constructor).

### Alur Program

```
main() -> MyApp (tema gelap) -> InputPage
InputPage: pilih gender, tinggi, berat, usia, rumus
   |  tekan CALCULATE -> Calculator menghitung BMR -> Navigator.push
   v
ResultPage: tampilkan BMR + kebutuhan kalori harian
   |  tekan RE-CALCULATE -> Navigator.pop
   v
kembali ke InputPage
```

### Struktur Folder

```
lib/
├── main.dart              # entry point & tema
├── constants.dart         # warna, gaya teks, enum Gender & BmrFormula, level aktivitas
├── calculator.dart        # logika perhitungan BMR
├── components/            # widget kustom (CustomCard, IconCard, RoundIconButton, BottomButton)
└── pages/
    ├── input_page.dart    # halaman input
    └── result_page.dart   # halaman hasil
```

## Screenshot

| Halaman Input | Halaman Hasil |
| :-----------: | :-----------: |
| ![Input Page](screenshots/input_page.png) | ![Result Page](screenshots/result_page.png) |

## Cara Menjalankan

```bash
flutter pub get
flutter run
```

Menjalankan unit test:

```bash
flutter test
```
