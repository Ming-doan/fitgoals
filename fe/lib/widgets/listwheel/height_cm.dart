import 'package:flutter/material.dart';

class HeightCm extends StatelessWidget {
  final int heightcm;
  final Color textColor;
  final double fontSize;

  const HeightCm(
      {required this.heightcm,
      required this.textColor,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      '.$heightcm',
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
