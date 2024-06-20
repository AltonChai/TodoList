import 'package:flutter/material.dart';
import 'package:todo_list/utils/mybutton.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 174, 144, 255),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //for user input
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Task",
              ),
            ),
            //buttons for save and end
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(text: "Add", onPressed: () {}), //add button
                const SizedBox(
                  width: 15,
                ),
                Mybutton(text: "Cancel", onPressed: () {}) //cancel button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
