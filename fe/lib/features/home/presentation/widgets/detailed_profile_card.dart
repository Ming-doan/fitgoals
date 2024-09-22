import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final fontFamily = GoogleFonts.beVietnamPro().fontFamily;

class DetailedProfileCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final List<RowData> additionalRows;

  const DetailedProfileCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.additionalRows = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row with specific margins
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Row(
            children: [
              // Ellipse with image
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              // Title and Subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: fontFamily,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: fontFamily,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Container for additional rows with specific margins
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              for (int i = 0; i < additionalRows.length; i++) ...[
                _buildAdditionalRow(additionalRows[i]),
                if (i < additionalRows.length - 1) const SizedBox(height: 15),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdditionalRow(RowData rowData) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.lightGrey,
      ),
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                rowData.title,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: fontFamily,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (rowData.subtitle != null)
                Text(
                  rowData.subtitle!,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
          // Right side
          if (rowData.rightText != null)
            Text(
              rowData.rightText!,
              style: TextStyle(
                color: AppColors.tertiary,
                fontFamily: fontFamily,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
          else if (rowData.value != null && rowData.unit != null)
            Row(
              children: [
                Text(
                  rowData.value!,
                  style: TextStyle(
                    color: AppColors.black,
                    fontFamily: fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  rowData.unit!,
                  style: TextStyle(
                    color: AppColors.subtitle,
                    fontFamily: fontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class RowData {
  final String title;
  final String? subtitle;
  final String? rightText;
  final String? value;
  final String? unit;

  RowData({
    required this.title,
    this.subtitle,
    this.rightText,
    this.value,
    this.unit,
  });
}
