// calculator.dart
//
// Berisi class Calculator yang merupakan LOGIKA perhitungan BMR
// (Basal Metabolic Rate = jumlah kalori yang dibakar tubuh saat istirahat total).
// Class ini murni logika (tanpa UI) sehingga mudah diuji dan dipakai ulang.
//
// Alur: InputPage membuat objek Calculator dengan data input pengguna,
// lalu memanggil calculateBMR(), getResult(), getInterpretation(), dan
// getDailyCalories() untuk dikirim ke ResultPage.

import 'constants.dart';

class Calculator {
  // Constructor dengan named parameter; semua data input wajib diisi.
  Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    required this.formula,
  });

  final int height; // tinggi badan (cm)
  final int weight; // berat badan (kg)
  final int age; // usia (tahun)
  final Gender gender; // jenis kelamin (menentukan konstanta rumus)
  final BmrFormula formula; // rumus yang dipilih pengguna

  // Hasil BMR dalam kalori/hari. Diisi saat calculateBMR() dipanggil.
  double _bmr = 0.0;

  // Langkah 1: hitung BMR sesuai rumus & gender, lalu kembalikan
  // sebagai String bulat (mis. "1478") untuk ditampilkan.
  String calculateBMR() {
    switch (formula) {
      case BmrFormula.mifflinStJeor:
        // Mifflin-St Jeor:
        //   Pria   : BMR = 10W + 6.25H - 5A + 5
        //   Wanita : BMR = 10W + 6.25H - 5A - 161
        // (W = berat kg, H = tinggi cm, A = usia tahun)
        final base = 10 * weight + 6.25 * height - 5 * age;
        _bmr = gender == Gender.male ? base + 5 : base - 161;
        break;
      case BmrFormula.harrisBenedict:
        // Revised Harris-Benedict:
        //   Pria   : BMR = 88.362 + 13.397W + 4.799H - 5.677A
        //   Wanita : BMR = 447.593 + 9.247W + 3.098H - 4.330A
        if (gender == Gender.male) {
          _bmr = 88.362 + 13.397 * weight + 4.799 * height - 5.677 * age;
        } else {
          _bmr = 447.593 + 9.247 * weight + 3.098 * height - 4.330 * age;
        }
        break;
    }
    return _bmr.round().toString();
  }

  // Langkah 2: label hijau di halaman hasil (nama rumus yang dipakai).
  String getResult() {
    return formulaName(formula);
  }

  // Langkah 3: kalimat penjelasan di bawah angka BMR.
  String getInterpretation() {
    return 'Your body burns about ${_bmr.round()} calories per day at complete '
        'rest. Eat fewer calories than your daily need to lose weight, '
        'and more to gain weight.';
  }

  // Langkah 4: kebutuhan kalori harian untuk setiap tingkat aktivitas
  // (BMR x pengali). Map menjaga urutan sesuai daftar activityLevels.
  Map<String, int> getDailyCalories() {
    return {
      for (final level in activityLevels)
        level.label: (_bmr * level.multiplier).round(),
    };
  }
}
