import 'package:fitgoals/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Model class
class TodoItem {
  final String title;
  final String subtitle;
  final int calories;
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
    return Row(
      children: [
        // Checkbox
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: item.isChecked,
            onChanged: onCheckboxChanged,
            activeColor: const Color(0xFFD21312),
            side: const BorderSide(
              color: Color(0xFFD21312),
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
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: "Be Vietnam Pro",
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                item.subtitle,
                style: const TextStyle(
                  color: Color(0xFF797979),
                  fontFamily: "Be Vietnam Pro",
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        // Right column with calories
        Row(
          children: [
            SvgPicture.asset(
              item.isIncreased
                  ? IconConstants.arrowUp
                  : IconConstants.arrowDown,
              width: 12,
              height: 12,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${item.calories}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: "Be Vietnam Pro",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const TextSpan(
                    text: 'cal',
                    style: TextStyle(
                      color: Color(0xFF797979),
                      fontFamily: "Be Vietnam Pro",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
        color: Colors.grey[200], // --Ceramic color
        // color: const Color(0xFFF9F9F9), // --Ceramic color
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
