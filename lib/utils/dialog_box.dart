import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 174, 144, 255),
      content: Container(
        height: 120,
        child: const Column(
          children: [
            //for user input
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "New Task",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
