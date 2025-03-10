import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //checkBox and Task Name
            // Checkbox(
            //   value: (),
            //   onChanged: {},
            // ),
            // Title Name
            Text(
              'MAKE TUTORIALS',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
