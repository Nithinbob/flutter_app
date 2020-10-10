import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_app/Helper/data_base_helper.dart';
import 'package:flutter_app/models/task.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskData with ChangeNotifier {
  List<Task> _list = [];

  void changeTheList(taskName) {
    futureAdd(taskName);
     _list.add(Task(name: taskName));
    notifyListeners();
  }

int gettaskListlength() {
    return _list.length;
  }

  Future<List<Map<String, dynamic>>> getList() async {
    List<Map<String, dynamic>> all = await DataBaseHelper.instance.getAll();
    // all.forEach((element) {
    //   _list.add(element[DataBaseHelper.columnName]);
    // });
    return all;
  }

  futureAdd(String taskName) async {
    await DataBaseHelper.instance.insert(
        {DataBaseHelper.columnName:taskName}
    );
  }


  void toggle(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void remove(String task,int index) async {
 int id=   await DataBaseHelper.instance.delete(index);
    print("aaaaaa11111      $id");
_list.remove(id);

notifyListeners();
  }
}
