import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List verygoodlist = [];

  //reference the box
  final _mybox = Hive.box('mybox');
  // this will run when first time app open
  void creatinitdata() {
    verygoodlist = [
      ["First task", false],
      ["Second", false],
    ];
  }

  //load data from db
  void loadData() {
    verygoodlist = _mybox.get("TODOLIST");
  }

  //update db
  void updatedb() {
    _mybox.put("TODOLIST", verygoodlist);
  }
}
