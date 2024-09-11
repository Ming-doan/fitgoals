import 'package:flutter/material.dart';

class Height extends StatelessWidget {
  final int height;
  final Color textColor;
  final double fontSize;

  const Height(
      {required this.height, required this.textColor, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      '.$height',
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
