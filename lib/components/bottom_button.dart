// bottom_button.dart
//
// Tombol lebar berwarna pink di bagian bawah layar.
// Dipakai sebagai tombol CALCULATE (InputPage) dan RE-CALCULATE (ResultPage).
// buttonTitle = teks tombol, onTap = aksi saat tombol ditekan.

import 'package:flutter/material.dart';
import 'package:bmr/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.buttonTitle, required this.onTap});

  final String buttonTitle;
  final Function() onTap;

  // build() dipanggil Flutter untuk menggambar widget ini ke layar.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        // width: double.infinity,
        height: bottomContainerHeight,
        color: bottomContainerColor,
        child: Center(
          child: Text(
            buttonTitle,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
