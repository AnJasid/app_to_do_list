import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, index) => Card(
        child: ListTile(
          title: Text(todos[index].title),
        ),
      ),
    );
  }
}
