import 'package:flutter/material.dart';

import 'package:todo_list/utils/dialog_box.dart';

import 'package:todo_list/utils/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();
  List verygoodlist = [
    ["Test 1 ", false],
    ["Test 2", false],
  ];
  // check the box got tap or not
  void checkthebox(bool? value, int index) {
    setState(() {
      verygoodlist[index][1] = !verygoodlist[index][1];
    });
  }

  void savenewtask() {
    setState(() {
      verygoodlist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createnewtiles() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onsave: savenewtask,
            oncancel: () => Navigator.of(context).pop(),
          );
        });
  }

// delete task
  void deleteTask(int index) {
    setState(() {
      verygoodlist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        //title bar
        backgroundColor: Colors.deepPurple[800],
        title: const Text("To Do List"),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: const TextStyle(
          //bar style
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createnewtiles();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: verygoodlist.length,
        itemBuilder: (context, index) {
          return Todotiles(
            taskname: verygoodlist[index][0],
            taskcomplete: verygoodlist[index][1],
            onChanged: (value) => checkthebox(value, index),
            deletetiles: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
