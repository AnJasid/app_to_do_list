import 'package:app_to_do_list/models/todo_task.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dummy list of tasks
  List<Task> tasks = [
    Task(taskName: 'taskName1'),
    Task(taskName: 'taskName2'),
    Task(taskName: 'taskName3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My To-Do List'),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Text('List Of Task'),
          ],
        ),
      ),
    );
  }
}
