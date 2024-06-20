import 'package:flutter/material.dart';
import 'package:todo_list/utils/mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.oncancel,
    required this.onsave,
  });

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
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Task",
              ),
            ),
            //buttons for save and end
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(text: "Add", onPressed: onsave), //add button
                const SizedBox(
                  width: 15,
                ),
                Mybutton(text: "Cancel", onPressed: oncancel) //cancel button
              ],
            ),
          ],
        ),
      ),
    );
  }
}
