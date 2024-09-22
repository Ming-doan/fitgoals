import 'package:fitgoals/core/constants/asset_paths.dart';
import 'package:fitgoals/core/constants/strings.dart';
import 'package:fitgoals/core/models/models.dart';
import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/features/home/presentation/widgets/chart_column.dart';
import 'package:fitgoals/features/home/presentation/widgets/item_card.dart';
import 'package:fitgoals/features/home/presentation/widgets/todos.dart';
import 'package:fitgoals/shared/widgets/header_bar.dart';
import 'package:fitgoals/shared/widgets/metric_display.dart';
import 'package:fitgoals/shared/widgets/regional.dart';
import 'package:flutter/material.dart';

class FitnessPage extends StatefulWidget {
  const FitnessPage({super.key});

  @override
  State<FitnessPage> createState() => _FitnessPageState();
}

class _FitnessPageState extends State<FitnessPage> {
  List<TodoItem> todoItems = [
    TodoItem(
      title: "Cardio",
      subtitle: "30 minutes",
      calories: 100,
      isIncreased: false,
    ),
    TodoItem(
      title: "Bulgarian Squat",
      subtitle: "20 reps, 4 sets",
      calories: 50,
      isIncreased: false,
    ),
    TodoItem(
      title: "Swim",
      subtitle: "1 hour",
      calories: 80,
      isIncreased: false,
    ),
  ];

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
                    Regional(
                      title: 'Today Fitness',
                      body: TodoList(todoItems: todoItems),
                    ),
                    const Regional(
                      title: 'Calendar',
                      body: ChartColumn(
                        dataPoints: [12, 10.5, 6, 2, 4, 0, 0],
                        targetPoint: 10,
                        colors: BarChartColors(
                          aboveTargetColor: AppColors.primary,
                          belowTargetColor: AppColors.secondary,
                          farBelowTargetColor: AppColors.tertiary,
                        ),
                        dateLabels: ['19', '20', '21', '22', '23', '24', '25'],
                      ),
                      // TODO
                    ),
                    Regional(
                      title: 'Exercise',
                      body: Column(
                        children: [
                          ItemCard(
                            imagePath: AppAssets.images.runner,
                            title: 'Running',
                            subtitle: const MetricDisplay(
                              isIncreased: false,
                              value: 100,
                              unit: AppTexts.calPerKm,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ItemCard(
                            imagePath: AppAssets.images.squat,
                            title: 'Squat',
                            subtitle: const MetricDisplay(
                              isIncreased: false,
                              value: 20,
                              unit: AppTexts.calPerRep,
                            ),
                          ),
                        ],
                      ),
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
