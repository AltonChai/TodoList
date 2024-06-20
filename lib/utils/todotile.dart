import 'package:flutter/material.dart';

class Todotiles extends StatelessWidget {
  final String taskname; //what is final && when do i need to use this struct
  final bool taskcomplete;
  final Function(bool?)? onChanged;
  const Todotiles({
    super.key,
    required this.taskname,
    required this.taskcomplete,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 20, left: 20, right: 20), //padding outside the container
      child: Container(
        //box for the tiles
        padding:
            const EdgeInsets.all(15), // padding inside container for the word
        decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          //the design
          children: [
            Checkbox(value: taskcomplete, onChanged: onChanged),
            Text(
              taskname,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                decoration: taskcomplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
