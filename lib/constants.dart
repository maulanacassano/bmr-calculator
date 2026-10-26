// constants.dart
//
// Berisi semua konstanta (warna, ukuran, gaya teks, enum) yang dipakai
// bersama oleh banyak file agar kode lebih rapi dan mudah diubah di satu tempat.

import 'package:flutter/material.dart';

// ---------- Warna & ukuran ----------
const activeCardColor = Color(0xFF1D1E33); // warna kartu yang aktif/terpilih
const inactiveCardColor = Color(0xFF111328); // warna kartu yang tidak terpilih
const bottomContainerHeight = 80.0; // tinggi tombol di bagian bawah layar
const bottomContainerColor = Color(0xFFEB1555); // warna tombol bawah (pink)

// ---------- Enum ----------
// Tipe data sendiri yang nilainya hanya boleh male atau female.
// Pada BMR, gender BENAR-BENAR memengaruhi hasil (rumus laki-laki dan
// perempuan berbeda), berbeda dengan BMI yang tidak memakai gender.
enum Gender {
  male,
  female,
}

// Pilihan rumus perhitungan BMR (mengacu pada calculator.net/bmr-calculator.html).
enum BmrFormula {
  mifflinStJeor, // rumus default calculator.net, paling akurat untuk populasi umum
  harrisBenedict, // Revised Harris-Benedict Equation
}

// Nama rumus yang ditampilkan di layar.
String formulaName(BmrFormula formula) {
  switch (formula) {
    case BmrFormula.mifflinStJeor:
      return 'Mifflin-St Jeor';
    case BmrFormula.harrisBenedict:
      return 'Harris-Benedict';
  }
}

// ---------- Tingkat aktivitas ----------
// Kebutuhan kalori harian = BMR x pengali aktivitas.
// Nilai pengali sama dengan yang dipakai calculator.net.
class ActivityLevel {
  const ActivityLevel(this.label, this.multiplier);

  final String label; // nama tingkat aktivitas
  final double multiplier; // pengali terhadap BMR
}

const activityLevels = [
  ActivityLevel('Sedentary (little or no exercise)', 1.2),
  ActivityLevel('Light (exercise 1-3 days/week)', 1.375),
  ActivityLevel('Moderate (exercise 3-5 days/week)', 1.55),
  ActivityLevel('Active (exercise 6-7 days/week)', 1.725),
  ActivityLevel('Very active (hard exercise daily)', 1.9),
];

// ---------- Gaya teks ----------
const labelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const numberTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);

const buttonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

// Angka besar hasil BMR di halaman hasil.
const bmrTextStyle = TextStyle(
  fontSize: 80,
  fontWeight: FontWeight.bold,
);
