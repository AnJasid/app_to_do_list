import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, indext) => ListTile(
        title: Text('data'),
      ),
    );
  }
}
