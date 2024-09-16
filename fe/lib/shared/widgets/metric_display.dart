import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fitgoals/core/constants/asset_paths.dart';
import 'package:fitgoals/core/theme/app_colors.dart';

class MetricDisplay extends StatelessWidget {
  final bool isIncreased;
  final double value;
  final String unit;
  final String fontFamily;

  const MetricDisplay({
    super.key,
    required this.isIncreased,
    required this.value,
    required this.unit,
    this.fontFamily = 'Be Vietnam Pro',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          isIncreased ? AppAssets.icons.arrowUp : AppAssets.icons.arrowDown,
          width: 12,
          height: 12,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: value.round().toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: unit,
                style: TextStyle(
                  color: AppColors.subtitle,
                  fontFamily: fontFamily,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
