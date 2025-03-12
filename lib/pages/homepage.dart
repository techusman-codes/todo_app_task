import 'package:flutter/material.dart';
import 'package:todolist_app/utils/todo_tile.dart';
import 'package:todolist_app/utils/dialogbox.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // controller
  final _controller = TextEditingController();
  // create list of todod
  List todoList = [
    ['Make Tutorial', true],
    ['Do Exercise', false],
  ];

  // check Box was tapp
  void checkBoxChange(bool? value, index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // create a new method for saveNewTask
  void saveNewTask() {
    setState(
      () {
        todoList.add(
          [_controller.text, false],
        );
        _controller.clear();
      },
    );
    Navigator.of(context).pop();
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
      todoList.removeAt(index);
    });
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
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
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
