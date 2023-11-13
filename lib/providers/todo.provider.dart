import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lecture_one/model/todo.model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _todoList = [];

  List<TodoModel> get todoList =>
      _todoList.where((task) => !task.status).toList();

  void addTask(String description) {
    _todoList.insert(0, TodoModel(false, description));
    notifyListeners();
  }

  void changeStatus(int index) {
    _todoList[index].status = true;
    notifyListeners();
  }

  void deleteTask(int index) {
    _todoList.removeAt(index);
    notifyListeners();
  }
}
