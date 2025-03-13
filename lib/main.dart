import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist_app/pages/homepage.dart';

void main() async {
  // initialize the Hive
  await Hive.initFlutter();
  // open Box
  // ignore: unused_local_variable
  var box = await Hive.openBox('myBox');
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
