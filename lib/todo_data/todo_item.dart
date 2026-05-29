import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoItem extends StatefulWidget {
  final Todo todos;
  final Function(int index) onDeleteTodo;
  final int index;

  const TodoItem({
    super.key,
    required this.todos,
    required this.onDeleteTodo,
    required this.index,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => widget.onDeleteTodo(widget.index),
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
          ),
          SlidableAction(
            onPressed: (context) => {},
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
          )
        ],
      ),
      child: Card(
        child: ListTile(
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
        ),
      ),
    );
  }
}
