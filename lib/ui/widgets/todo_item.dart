import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../entities/todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo, required this.onIconButtonPressed,
  });

  final Todo todo;
  final VoidCallback onIconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 6),
        surfaceTintColor:_getCardTinColor(todo.isDone),
        color: _getCardBGColor(todo.isDone),
        child: ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: _getTextDecoration(todo.isDone),
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(todo.description),
                Text(DateFormat.yMEd().add_jms().format(todo.time)),
              ],
            ),
            trailing: _buildRoundedIconButton(todo.isDone)));
  }

  Widget _buildRoundedIconButton(bool isDone) {
    return GestureDetector(
      onTap: onIconButtonPressed,
      child: Container(
        child: Icon(_getIcon(todo.isDone)),
      ),
    );
  }

  IconData _getIcon(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }
  Color? _getCardTinColor(bool isDone) {
    return isDone ? Colors.green: null;
  }
  Color? _getCardBGColor(bool isDone) {
    return isDone ? Colors.green.shade100: null;
  }
}
