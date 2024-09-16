import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/features/welcome/presentation/widgets/age.dart';
import 'package:fitgoals/features/welcome/presentation/widgets/height_cm.dart';
import 'package:flutter/material.dart';

class ListWheelScrollHeight extends StatefulWidget {
  const ListWheelScrollHeight({super.key});

  @override
  State<ListWheelScrollHeight> createState() => _ListWheelScrollState();
}

class _ListWheelScrollState extends State<ListWheelScrollHeight> {
  final FixedExtentScrollController _controller = FixedExtentScrollController();
  int selectedIndexHm = 0;
  int selectedIndexHcm = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 110,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 100,
              perspective: 0.005,
              diameterRatio: 1.5,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedIndexHm = index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 200,
                builder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Age(
                      age: index,
                      textColor: selectedIndexHm == index
                          ? AppColors.primary
                          : const Color(0xffE1E1E1),
                      fontSize: selectedIndexHm == index ? 60 : 40,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 90,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 100,
              perspective: 0.005,
              diameterRatio: 1.5,
              physics: const FixedExtentScrollPhysics(),
              onSelectedItemChanged: (index) {
                setState(() {
                  selectedIndexHcm = index;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 10,
                builder: (context, index) {
                  return Container(
                    height: 60,
                    alignment: Alignment.center,
                    child: HeightCm(
                      heightcm: index,
                      textColor: selectedIndexHcm == index
                          ? AppColors.primary
                          : const Color(0xffE1E1E1),
                      fontSize: selectedIndexHcm == index ? 60 : 40,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
