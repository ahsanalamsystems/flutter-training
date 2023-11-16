import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lecture_one/model/todo.model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _todoList = [];

  List<TodoModel> get todoList =>
      _todoList.where((task) => !task.status).toList();
  List<TodoModel> get completedTaskList =>
      _todoList.where((task) => task.status).toList();

  void addTask(String description) {
    _todoList.insert(0, TodoModel(generateId(), false, description));
    notifyListeners();
  }

  void changeStatus(int index) {
    todoList[index].status = true;
    notifyListeners();
  }

  void deleteTask(int id, String type) {
    _todoList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  int generateId() {
    final Random random = new Random();
    return random.nextInt(2) * 3 + DateTime.now().millisecond;
  }
}
