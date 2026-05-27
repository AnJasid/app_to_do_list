import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';
import 'package:app_to_do_list/todo_data/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, index) =>
          TodoItem(todos: todos[index]),
    );
  }
}
