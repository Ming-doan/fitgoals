import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteBlock extends StatelessWidget {
  final String quote;
  const QuoteBlock({super.key, required this.quote});

  @override
  Widget build(BuildContext context) {
    String? quoteFont = GoogleFonts.bebasNeue().fontFamily;

    return Container(
        height: 160,
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned(
              top: -10,
              left: 10,
              child: Text("“",
                  style: TextStyle(
                      fontSize: 80,
                      fontFamily: quoteFont,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary)),
            ),
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(quote,
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: quoteFont,
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
                      const Text("Quote of the day",
                          style: TextStyle(fontSize: 10, color: Colors.grey)),
                    ]),
              ),
            ),
          ],
        ));
  }
}
