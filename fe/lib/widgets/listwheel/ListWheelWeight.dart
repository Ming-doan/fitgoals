import 'package:fitgoals/widgets/listwheel/age.dart';
import 'package:fitgoals/widgets/listwheel/height_cm.dart';
import 'package:flutter/material.dart';

class ListWheelScrollWeight extends StatefulWidget {
  const ListWheelScrollWeight({super.key});

  @override
  State<ListWheelScrollWeight> createState() => _ListWheelScrollState();
}

class _ListWheelScrollState extends State<ListWheelScrollWeight> {
  FixedExtentScrollController _controller = FixedExtentScrollController();
  int selectedIndexHm = 0;
  int selectedIndexHcm = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 110,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 100,
              perspective: 0.005,
              diameterRatio: 1.5,
              physics: FixedExtentScrollPhysics(),
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
                            ? const Color(0xffD21312)
                            : const Color(0xffE1E1E1),
                        fontSize: selectedIndexHm == index ? 60 : 40),
                  );
                },
              ),
            ),
          ),
          Container(
            width: 90,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 100,
              perspective: 0.005,
              diameterRatio: 1.5,
              physics: FixedExtentScrollPhysics(),
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
                            ? const Color(0xffD21312)
                            : const Color(0xffE1E1E1),
                        fontSize: selectedIndexHcm == index ? 60 : 40),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
