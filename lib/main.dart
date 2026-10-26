// main.dart
//
// Titik masuk (entry point) aplikasi BMR Calculator.
// Alur program:
//   main() -> runApp(MyApp) -> MaterialApp (tema gelap) -> InputPage
//   InputPage --(tombol CALCULATE)--> ResultPage
//   ResultPage --(tombol RE-CALCULATE)--> kembali ke InputPage

import 'package:flutter/material.dart';
import 'package:bmr/pages/input_page.dart';

// Fungsi pertama yang dijalankan Flutter.
void main() {
  runApp(const MyApp());
}

// Widget akar (root) aplikasi. Stateless karena hanya mengatur tema.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMR Calculator',
      debugShowCheckedModeBanner: false,
      // Tema gelap dengan warna kustom, diterapkan ke seluruh halaman.
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
      // Halaman pertama yang tampil saat aplikasi dibuka.
      home: const InputPage(),
    );
  }
}
