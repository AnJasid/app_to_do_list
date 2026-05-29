import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({
    super.key,
    required this.onAddTodo,
    required this.onDeleteTodo,
  });

  final void Function(Todo todo) onAddTodo;
  final void Function(int index) onDeleteTodo;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please make sure a valid title was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please make sure a valid title was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text('Okay'),
            ),
          ],
        ),
      );
    }
  }

  void _submitTodoData() {
    if (_titleController.text.trim().isEmpty) {
      _showDialog();
      return;
    }

    widget.onAddTodo(
      Todo(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        title: _titleController.text,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            'Enter the new task',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitTodoData,
                child: Text('Save Todo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
