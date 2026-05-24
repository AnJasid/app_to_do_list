import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo todos;
  const TodoItem({
    super.key,
    required this.todos,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.todos.isCompleted,
        onChanged: (value) {
          setState(() {
            widget.todos.isCompleted = value!;
          });
        },
      ),
      title: Text(
        widget.todos.title,
        style: TextStyle(
          decoration: widget.todos.isCompleted
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
    );
  }
}
