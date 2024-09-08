import 'package:fitgoals/widgets/HomeScreens/quote_block.dart';
import 'package:fitgoals/widgets/HomeScreens/todos.dart';
import 'package:fitgoals/widgets/Shared/header_bar.dart';
import 'package:fitgoals/widgets/Shared/regional.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<TodoItem> todoItems1 = [
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

  List<TodoItem> todoItems2 = [
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
      calories: 20,
      isIncreased: true,
    ),
  ];

  List<TodoItem> todoItems3 = [
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
      body: SafeArea(
        child: Column(
          children: [
            const HeaderBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const QuoteBlock(
                      quote:
                          "The only bad workout is the one that didn't happen.",
                    ),
                    Regional(
                      title: "Today Fitness",
                      todoItems: todoItems1,
                      child: const Text("No workouts for today."),
                    ),
                    Regional(
                      title: "Meals",
                      todoItems: todoItems2,
                    ),
                    Regional(
                      title: "Supplements",
                      todoItems: todoItems3,
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
