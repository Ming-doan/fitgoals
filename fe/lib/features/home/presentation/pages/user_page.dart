import 'package:fitgoals/core/constants/asset_paths.dart';
import 'package:fitgoals/core/models/models.dart';
import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/features/home/presentation/widgets/chart_column_2.dart';
import 'package:fitgoals/features/home/presentation/widgets/detailed_profile_card.dart';
import 'package:fitgoals/shared/widgets/header_bar.dart';
import 'package:fitgoals/shared/widgets/regional.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const HeaderBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    DetailedProfileCard(
                      imagePath: AppAssets.images.userDefault,
                      title: 'Trong Nhan',
                      subtitle: '🔥 since 2023',
                      additionalRows: [
                        RowData(
                          title: 'BMI',
                          subtitle: 'Body Mass Index',
                          rightText: '50.2',
                        ),
                        RowData(
                          title: 'Height',
                          value: '170.5',
                          unit: 'cm',
                        ),
                        RowData(
                          title: 'Mass',
                          value: '145',
                          unit: 'kg',
                        ),
                      ],
                    ),
                    const Regional(
                      title: 'Your track',
                      body: ChartColumn2(
                        dataPoints: [12, 10.5, 6, 2, 4, 0, 0],
                        targetPoint1: 10,
                        targetPoint2: 10,
                        colors: BarChartColors(
                          aboveTargetColor: AppColors.greenPrimary,
                          belowTargetColor: AppColors.greenSecondary,
                          farBelowTargetColor: AppColors.greenTertiary,
                        ),
                        dateLabels: ['19', '20', '21', '22', '23', '24', '25'],
                      ),
                      // TODO
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
