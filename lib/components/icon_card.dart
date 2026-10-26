// icon_card.dart
//
// Isi kartu berupa ikon besar + teks di bawahnya.
// Dipakai pada kartu gender (ikon MALE dan FEMALE dari Font Awesome).

import 'package:flutter/material.dart';
import 'package:bmr/constants.dart';

class IconCard extends StatelessWidget {
  IconCard({this.cardIcon, required this.caption});

  final IconData? cardIcon;
  final String caption;

  // build() dipanggil Flutter untuk menggambar widget ini ke layar.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 70.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          caption,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
