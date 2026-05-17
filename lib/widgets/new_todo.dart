import 'package:flutter/material.dart';
import 'package:app_to_do_list/models/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({
    super.key,
    required this.onAddTodo,
  });

  final void Function(Todo todo) onAddTodo;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final _titleController = TextEditingController();

  void _submitTodoData() {
    widget.onAddTodo(
      Todo(title: _titleController.text),
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
