import 'package:fitgoals/resources/app_colors.dart';
import 'package:fitgoals/resources/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteBlock extends StatelessWidget {
  final String quote;
  const QuoteBlock({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    String? quoteFont = GoogleFonts.bebasNeue().fontFamily;
    String? textFooterFont = GoogleFonts.beVietnamPro().fontFamily;

    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: AppColors.lightGrey,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            top: -15,
            left: 7,
            child: Text(
              AppTexts.quoteChar,
              style: TextStyle(
                fontSize: 96,
                fontFamily: quoteFont,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      quote,
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: quoteFont,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Text(
                    AppTexts.quoteDailyText,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.grey,
                      fontFamily: textFooterFont,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
