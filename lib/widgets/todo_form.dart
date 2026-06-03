import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({
    super.key,
    this.todo,
    required this.onAddTodo,
    required this.onUpdateTodo,
  });

  final Todo? todo;
  final void Function(Todo todo) onAddTodo;
  final Function(Todo oldTodo, String updatedTitle) onUpdateTodo;

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
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

    if (widget.todo == null) {
      widget.onAddTodo(
        Todo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: _titleController.text,
        ),
      );
    } else {
      widget.onUpdateTodo(
        widget.todo!,
        _titleController.text,
      );
    }
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    if (widget.todo != null) {
      _titleController.text = widget.todo!.title;
    }
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
                child: Text(widget.todo == null ? 'Add Todo' : 'Save Todo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
