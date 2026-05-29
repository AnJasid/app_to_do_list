import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';
import 'package:app_to_do_list/todo_data/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.todos,
    required this.onDeleteTodo,
  });

  final List<Todo> todos;
  final Function(int index) onDeleteTodo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, index) => TodoItem(
        todos: todos[index],
        index: index,
        onDeleteTodo: onDeleteTodo,
      ),
    );
  }
}
