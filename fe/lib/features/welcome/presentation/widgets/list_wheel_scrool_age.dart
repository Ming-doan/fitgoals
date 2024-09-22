import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/features/welcome/presentation/widgets/age.dart';
import 'package:flutter/material.dart';

class ListWheelScrollAge extends StatefulWidget {
  const ListWheelScrollAge({super.key});

  @override
  State<ListWheelScrollAge> createState() => _ListWheelScrollState();
}

class _ListWheelScrollState extends State<ListWheelScrollAge> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListWheelScrollView.useDelegate(
        controller: _controller,
        itemExtent: 100,
        perspective: 0.005,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 100,
          builder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Age(
                age: index,
                textColor: selectedIndex == index
                    ? AppColors.primary
                    : const Color(0xffE1E1E1),
                fontSize: selectedIndex == index ? 60 : 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
