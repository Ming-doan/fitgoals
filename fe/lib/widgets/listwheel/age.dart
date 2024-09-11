import 'package:flutter/material.dart';

class Age extends StatelessWidget {
  final int age;
  final Color textColor;
  final double fontSize;

  const Age(
      {required this.age, required this.textColor, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$age',
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
