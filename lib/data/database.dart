import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  // refrence the box
  // ignore: unused_field
  final _myBox = Hive.box('myBox');

  // we need three methods

  //1 run this if its your first time opening this app
  void createInitalData() {
    toDoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false],
    ];
  }

  // 2 load the Data from the database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // 3 update Data from the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
