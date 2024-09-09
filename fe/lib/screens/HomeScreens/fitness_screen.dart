import 'package:fitgoals/widgets/HomeScreens/chart_column.dart';
import 'package:fitgoals/widgets/HomeScreens/todos.dart';
import 'package:fitgoals/widgets/Shared/header_bar.dart';
import 'package:fitgoals/widgets/Shared/regional.dart';
import 'package:flutter/material.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({super.key});

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
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
      body: SafeArea(
        child: Column(
          children: [
            const HeaderBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Regional(
                      title: "Today Fitness",
                      todoItems: todoItems,
                      child: const Text("No workouts for today."),
                    ),
                    const SizedBox(height: 10),
                    const ChartColumn(),
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
