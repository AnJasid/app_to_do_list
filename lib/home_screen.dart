import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      ),
      body: Container(
        child: Text('Your List Of TODO\'s'),
      ),
    );
  }
}
