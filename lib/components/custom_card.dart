// custom_card.dart
//
// Widget kartu (kotak berwarna dengan sudut melengkung) yang dipakai
// berulang kali di InputPage dan ResultPage (gender, tinggi, berat, usia, hasil).
// Parameter: color = warna kartu, cardChild = isi kartu,
// onPress = fungsi yang dipanggil saat kartu diketuk (opsional).

import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final Function()? onPress;

  // build() dipanggil Flutter untuk menggambar widget ini ke layar.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.only(left: 1.0, right: 1.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
