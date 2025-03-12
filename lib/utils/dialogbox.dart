// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todolist_app/utils/my_bottom.dart';

// ignore: must_be_immutable
class Dialogbox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  // create a method for cancel and save button
  VoidCallback onSave;
  VoidCallback cancel;
  Dialogbox({
    super.key,
    required this.onSave,
    required this.cancel,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new Task',
              ),
            ),
            // button -> user botton
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyBottom(
                  text: "Save",
                  onPressed: onSave,
                ),
                // canccel botton
                SizedBox(
                  width: 8,
                ),
                MyBottom(
                  text: "Cancel",
                  onPressed: cancel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
