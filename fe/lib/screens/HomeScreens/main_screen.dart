import 'package:fitgoals/widgets/HomeScreens/quote_block.dart';
import 'package:fitgoals/widgets/Shared/header_bar.dart';
import 'package:fitgoals/widgets/Shared/regional.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        HeaderBar(),
        SizedBox(height: 10),
        QuoteBlock(
          quote: "The only bad workout is the one that didn't happen.",
        ),
        Regional(
          title: "Today Fitness",
          action: Text("See all"),
          child: Text("No workouts for today."),
        )
      ],
    );
  }
}
