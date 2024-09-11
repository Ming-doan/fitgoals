import 'package:fitgoals/widgets/listwheel/age.dart';
import 'package:flutter/material.dart';

class ListWheelScrollAge extends StatefulWidget {
  const ListWheelScrollAge({super.key});

  @override
  State<ListWheelScrollAge> createState() => _ListWheelScrollState();
}

class _ListWheelScrollState extends State<ListWheelScrollAge> {
  FixedExtentScrollController _controller = FixedExtentScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: ListWheelScrollView.useDelegate(
          controller: _controller,
          itemExtent: 100,
          perspective: 0.005,
          diameterRatio: 1.5,
          physics: FixedExtentScrollPhysics(),
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
                        ? const Color(0xffD21312)
                        : const Color(0xffE1E1E1),
                    fontSize: selectedIndex == index ? 60 : 40),
              );
            },
          ),
        ),
      ),
    );
  }
}
