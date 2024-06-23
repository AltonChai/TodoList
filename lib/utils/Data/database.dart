import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List verygoodlist = [];

  //reference the box
  final _mybox = Hive.openBox('mybox');
}
