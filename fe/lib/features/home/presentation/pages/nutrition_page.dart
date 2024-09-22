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

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  List<TodoItem> todoItems = [
    TodoItem(
      title: "Bread & Milk",
      subtitle: "Breakfast",
      calories: 60,
      isIncreased: true,
    ),
    TodoItem(
      title: "Rice, Fish, Carrot",
      subtitle: "Lunch",
      calories: 150,
      isIncreased: true,
    ),
    TodoItem(
      title: "Noodles, Tofu",
      subtitle: "Dinner",
      calories: 50,
      isIncreased: true,
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
                      title: 'Today Meals',
                      body: TodoList(todoItems: todoItems),
                    ),
                    const Regional(
                      title: 'Calendar',
                      body: ChartColumn(
                        dataPoints: [12, 10.5, 6, 2, 4, 0, 0],
                        targetPoint: 10,
                        colors: BarChartColors(
                          aboveTargetColor: AppColors.greenPrimary,
                          belowTargetColor: AppColors.greenSecondary,
                          farBelowTargetColor: AppColors.greenTertiary,
                        ),
                        dateLabels: ['19', '20', '21', '22', '23', '24', '25'],
                      ),
                      // TODO
                    ),
                    Regional(
                      title: 'Recommend Foods',
                      body: Column(
                        children: [
                          ItemCard(
                            imagePath: AppAssets.images.chicken,
                            title: 'Chicken',
                            subtitle: const MetricDisplay(
                              isIncreased: true,
                              value: 30,
                              unit: AppTexts.calPerGam,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ItemCard(
                            imagePath: AppAssets.images.egg,
                            title: 'Egg',
                            subtitle: const MetricDisplay(
                              isIncreased: true,
                              value: 10,
                              unit: AppTexts.calPerUnit,
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
