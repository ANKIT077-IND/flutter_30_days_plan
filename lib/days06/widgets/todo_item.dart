import 'package:flutter/material.dart';
import 'package:flutter_30_days_plan/days06/todo_model.dart';

class TodoItem extends StatelessWidget {
  final VoidCallback updateOnTap;
  final VoidCallback deleteOnTap;
  final Todo item;
  const TodoItem({
    required this.deleteOnTap,
    required this.updateOnTap,
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item.status == TodoStatus.completed
          ? Icon(Icons.check_circle)
          : Icon(Icons.radio_button_unchecked),
      title: Text(
        item.title.toString(),
        style: TextStyle(
          decoration: item.status == TodoStatus.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        item.status == TodoStatus.completed ? "Completed" : "Pending",
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: updateOnTap, icon: Icon(Icons.edit)),
          IconButton(onPressed: deleteOnTap, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
