import 'package:flutter/material.dart';
import 'package:flutter_todo_list/TaskModel.dart';

class TodoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];
  addTaskInList() {
    TaskModel taskModel = TaskModel(" ${taskList.length}",
        "this is the task no. detail ${taskList.length}");
    taskList.add(taskModel);

    notifyListeners();
  }
}
