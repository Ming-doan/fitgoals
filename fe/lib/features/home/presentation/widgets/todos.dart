import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fitgoals/core/constants/strings.dart';
import 'package:fitgoals/shared/widgets/metric_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Model class
class TodoItem {
  final String title;
  final String subtitle;
  final double calories;
  final bool isIncreased;
  bool isChecked;

  TodoItem({
    required this.title,
    required this.subtitle,
    required this.calories,
    required this.isIncreased,
    this.isChecked = false,
  });
}

// Widget to display a single TodoItem
class TodoItemWidget extends StatelessWidget {
  final TodoItem item;
  final Function(bool?) onCheckboxChanged;

  const TodoItemWidget({
    super.key,
    required this.item,
    required this.onCheckboxChanged,
  });

  @override
  Widget build(BuildContext context) {
    final fontFamily = GoogleFonts.beVietnamPro().fontFamily;

    return Row(
      children: [
        // Checkbox
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: item.isChecked,
            onChanged: onCheckboxChanged,
            activeColor: AppColors.primary,
            side: const BorderSide(
              color: AppColors.primary,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        const SizedBox(width: 10),
        // Middle column with title and subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: fontFamily,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                item.subtitle,
                style: TextStyle(
                  color: AppColors.subtitle,
                  fontFamily: fontFamily,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        MetricDisplay(
          isIncreased: item.isIncreased,
          value: item.calories,
          unit: AppTexts.caloriesUnit,
        ),
      ],
    );
  }
}

// Widget to display the list of TodoItems
class TodoList extends StatefulWidget {
  final List<TodoItem> todoItems;

  const TodoList({super.key, required this.todoItems});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            16, 16, 16, 0), // Add some padding inside the container
        child: Column(
          children: widget.todoItems.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: TodoItemWidget(
                item: item,
                onCheckboxChanged: (bool? value) {
                  setState(() {
                    item.isChecked = value ?? false;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
