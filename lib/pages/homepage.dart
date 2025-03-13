import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist_app/data/database.dart';
import 'package:todolist_app/utils/todo_tile.dart';
import 'package:todolist_app/utils/dialogbox.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // refrence this box
  // ignore: unused_field
  final _myBox = Hive.box('myBox');

  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    // if this is the first time opening the app then create a default DATA

    if (_myBox.get("TODOLIST") == null) {
      db.createInitalData();
    } else {
      // there is already exist DATA
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();
  // create list of todod
  // List todoList = [
  //   ['Make Tutorial', true],
  //   ['Do Exercise', false],
  // ];

  // check Box was tapp
  void checkBoxChange(bool? value, index) {
    setState(() {
      db.toDoList[index][1] = db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // create a new method for saveNewTask
  void saveNewTask() {
    setState(
      () {
        db.toDoList.add(
          [_controller.text, false],
        );
        _controller.clear();
      },
    );
    Navigator.of(context).pop();
    db.updateDataBase();
  }

// create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialogbox(
          onSave: saveNewTask,
          cancel: () => Navigator.of(context).pop(),
          controller: _controller,
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.deepPurple[200],
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) {
              checkBoxChange(value, index);
            },
            deleteFunction: (context) => deleteTask,
          );
        },
      ),
    );
  }
}
