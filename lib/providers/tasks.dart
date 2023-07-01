import 'package:flutter/material.dart';
import '../models/task_status.dart';
import '../models/task.dart';

class Tasks with ChangeNotifier {
  final List<Task> _items = [];

  List<Task> get items {
    return [..._items];
  }

  List<Task> getItemsByStatus(TaskStatus status) {
    return _items.where((Task current) {
      return current.status == status;
    }).toList();
  }

  Task getItemById(int id) {
    //cloning task making
    return _items.firstWhere((Task current) {
      return current.id == id;
    }).copy();
  }

  void createNewItem(Task task) {
    task.id = _items.isNotEmpty ?_items
            .map((t) => t.id)
            .reduce((value, element) => element > value ? element : value) +
        1 : 1;
    _items.add(task);
    notifyListeners();
  }

  void updateItem(Task task) {
    int index = _items.indexWhere((Task current) {
      return current.id == task.id;
    });
    if (index >= 0) {
      _items[index] = task;
      notifyListeners();
    }
  }

  void removeItem(Task task) {
    _items.removeWhere((Task current) {
      return current.id == task.id;
    });
    notifyListeners();
  }
}
