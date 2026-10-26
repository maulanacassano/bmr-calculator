// result_page.dart
//
// Halaman kedua: menampilkan hasil perhitungan BMR dan kebutuhan kalori
// harian berdasarkan tingkat aktivitas. Halaman ini StatelessWidget karena
// hanya menampilkan data yang DIKIRIM dari InputPage (lewat constructor),
// dan tidak mengubah datanya sendiri.
//
// Tombol RE-CALCULATE memanggil Navigator.pop() untuk kembali ke InputPage.

import 'package:flutter/material.dart';
import 'package:bmr/components/custom_card.dart';
import 'package:bmr/constants.dart';
import 'package:bmr/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    required this.result,
    required this.bmr,
    required this.information,
    required this.dailyCalories,
  });

  final String result; // nama rumus yang dipakai (teks hijau)
  final String bmr; // angka BMR (kalori/hari)
  final String information; // kalimat penjelasan
  final Map<String, int> dailyCalories; // kebutuhan kalori per tingkat aktivitas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Judul "Your Result".
          Container(
            padding: const EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Kartu hasil. Dibungkus scroll agar tidak overflow di layar kecil.
          Expanded(
            child: CustomCard(
              color: activeCardColor,
              cardChild: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Nama rumus.
                      Text(
                        result,
                        style: resultTextStyle,
                      ),
                      // Angka BMR besar.
                      Text(
                        bmr,
                        style: bmrTextStyle,
                      ),
                      const Text(
                        'Calories/day',
                        style: labelTextStyle,
                      ),
                      const SizedBox(height: 12.0),
                      // Penjelasan singkat.
                      Text(
                        information,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      const Divider(height: 32.0, color: Color(0xFF8D8E98)),
                      const Text(
                        'DAILY CALORIE NEEDS',
                        style: labelTextStyle,
                      ),
                      const SizedBox(height: 8.0),
                      // Satu baris per tingkat aktivitas: label di kiri, kalori di kanan.
                      for (final entry in dailyCalories.entries)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  entry.key,
                                  style: const TextStyle(fontSize: 14.0),
                                ),
                              ),
                              Text(
                                '${entry.value} kcal',
                                style: resultTextStyle.copyWith(fontSize: 16.0),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Tombol kembali ke halaman input.
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              // Menutup halaman ini dan kembali ke InputPage.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
