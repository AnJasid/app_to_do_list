import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app_to_do_list/widgets/todo_form.dart';
import 'package:app_to_do_list/models/todo.dart';
import 'package:app_to_do_list/todo_data/todo_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoHomeScreen extends StatefulWidget {
  const TodoHomeScreen({super.key});

  @override
  State<TodoHomeScreen> createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  List<Todo> _registeredTodos = []; // List of Todos

  void _openAddTodoOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => TodoForm(
        onAddTodo: _addTodo,
        onUpdateTodo: _updateTodo,
      ),
    );
  }

  // Add Todo
  void _addTodo(Todo todo) {
    setState(() {
      _registeredTodos.add(todo);
    });
    _saveTodos();
  }

  // Delete Todo
  void _deleteTodo(int index) {
    setState(() {
      _registeredTodos.removeAt(index);
    });
    _saveTodos();
  }

  // Update Todo
  void _openEditTodoOverlay(int index) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => TodoForm(
        todo: _registeredTodos[index],
        onAddTodo: _addTodo,
        onUpdateTodo: _updateTodo,
      ),
    );
  }

  void _updateTodo(Todo todo, String newTitle) {
    setState(() {
      todo.title = newTitle;
    });
    _saveTodos();
  }

  // LOAD todos when app starts
  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();

    final String? todosString = prefs.getString('todos');

    if (todosString == null) return;

    final List decoded = jsonDecode(todosString);

    setState(() {
      _registeredTodos = decoded.map((item) => Todo.fromJson(item)).toList();
    });
  }

  // SAVE todos function
  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();

    final String encodedData = jsonEncode(
      _registeredTodos.map((todo) => todo.toJson()).toList(),
    );

    await prefs.setString('todos', encodedData);
  }

  @override
  void initState() {
    super.initState();
    _loadTodos();
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
          onEditTodo: _openEditTodoOverlay,
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
