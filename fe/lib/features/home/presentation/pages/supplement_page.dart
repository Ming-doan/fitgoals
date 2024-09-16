import 'package:fitgoals/core/constants/asset_paths.dart';
import 'package:fitgoals/core/constants/strings.dart';
import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/features/home/presentation/widgets/item_card.dart';
import 'package:fitgoals/features/home/presentation/widgets/todos.dart';
import 'package:fitgoals/shared/widgets/header_bar.dart';
import 'package:fitgoals/shared/widgets/metric_display.dart';
import 'package:fitgoals/shared/widgets/regional.dart';
import 'package:flutter/material.dart';

class SupplementPage extends StatefulWidget {
  const SupplementPage({super.key});

  @override
  State<SupplementPage> createState() => _SupplementPageState();
}

class _SupplementPageState extends State<SupplementPage> {
  List<TodoItem> todoItems = [
    TodoItem(
      title: "Whey proteins",
      subtitle: "1.5 cups",
      calories: 20,
      isIncreased: true,
    ),
    TodoItem(
      title: "Creatine",
      subtitle: "0.5 spoons",
      calories: 150,
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
                      title: 'Today Supplements',
                      body: TodoList(todoItems: todoItems),
                    ),
                    Regional(
                      title: 'Recommend Supplements',
                      body: Column(
                        children: [
                          ItemCard(
                            imagePath: AppAssets.images.supplement,
                            title: 'Chicken',
                            subtitle: const MetricDisplay(
                              isIncreased: true,
                              value: 30,
                              unit: AppTexts.calPerGam,
                            ),
                          ),
                          const SizedBox(height: 10),
                          // TODO
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
