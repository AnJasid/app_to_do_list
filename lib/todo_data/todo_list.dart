import 'package:flutter/material.dart';
import 'package:app_to_do_list/todo_data/todo_data.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    TodoData todoData = TodoData();
    return ListView.builder(
      itemCount: todoData.todoDataList.length,
      itemBuilder: (BuildContext context, index) => Card(
        child: ListTile(
          title: Text('hello'),
        ),
      ),
    );
  }
}
