import 'package:flutter/material.dart';
import 'package:todolist_app/utils/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "TO DO",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          TodoTile(),
          TodoTile(),
          TodoTile(),
          TodoTile(),
          TodoTile(),
        ],
      ),
    );
  }
}
