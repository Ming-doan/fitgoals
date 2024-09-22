import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/shared/widgets/metric_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final MetricDisplay subtitle;

  const ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Left padding
          const SizedBox(width: 30),
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              imagePath,
              width: 65,
              height: 78,
              fit: BoxFit.cover,
            ),
          ),
          // Title and Subtitle
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.black,
                      fontFamily: GoogleFonts.beVietnamPro().fontFamily,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
