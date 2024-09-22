import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Regional extends StatelessWidget {
  final String title;
  final Widget? action;
  final Widget body;

  const Regional({
    super.key,
    required this.title,
    this.action,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    String? titleFont = GoogleFonts.bebasNeue().fontFamily;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: titleFont,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (action != null) action!,
            ],
          ),
          const SizedBox(height: 10),
          body,
        ],
      ),
    );
  }
}
