// round_icon_button.dart
//
// Tombol bulat kecil dengan ikon (+ atau -).
// Dipakai untuk menambah/mengurangi nilai berat badan dan usia.

import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  // build() dipanggil Flutter untuk menggambar widget ini ke layar.
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
