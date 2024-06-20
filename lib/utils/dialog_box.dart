import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Color.fromARGB(255, 174, 144, 255),
      content: SizedBox(
        height: 120,
        child: Column(
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
