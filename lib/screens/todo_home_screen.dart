import 'package:flutter/material.dart';
import 'package:app_to_do_list/widgets/new_todo.dart';
import 'package:app_to_do_list/models/todo.dart';
import 'package:app_to_do_list/todo_data/todo_list.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  final List<Todo> _registeredTodos = [];

  void _openAddTodoOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewTodo(
        onAddTodo: _addTodo,
        onDeleteTodo: _deleteTodo,
      ),
    );
  }

  void _addTodo(Todo todo) {
    setState(() {
      _registeredTodos.add(todo);
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _registeredTodos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Todos'),
      ),
      body: Center(
        child: TodoList(
          todos: _registeredTodos,
          onDeleteTodo: _deleteTodo,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAddTodoOverlay();
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }
}
