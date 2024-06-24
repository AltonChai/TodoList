import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list/utils/Data/database.dart';
import 'package:todo_list/utils/dialog_box.dart';
import 'package:todo_list/utils/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    super.initState();
    // if first time launching , create default data
    if (_myBox.get("TODOLIST") == null) {
      db.creatinitdata();
    } else {
      //already have data in the list
      db.loadData();
    }
  }

  // text controller
  final _controller = TextEditingController();

  // check the box got tap or not
  void checkthebox(bool? value, int index) {
    setState(() {
      db.verygoodlist[index][1] = !db.verygoodlist[index][1];
    });
    db.updatedb();
  }

  void savenewtask() {
    setState(() {
      db.verygoodlist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedb();
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
    db.updatedb();
  }

// delete task
  void deleteTask(int index) {
    setState(() {
      db.verygoodlist.removeAt(index);
    });
    db.updatedb();
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
        itemCount: db.verygoodlist.length,
        itemBuilder: (context, index) {
          return Todotiles(
            taskname: db.verygoodlist[index][0],
            taskcomplete: db.verygoodlist[index][1],
            onChanged: (value) => checkthebox(value, index),
            deletetiles: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
