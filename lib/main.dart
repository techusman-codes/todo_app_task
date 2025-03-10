import 'package:flutter/material.dart';
import 'package:todolist_app/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List App',
      home: Homepage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple.shade200,
      ),
    );
  }
}
