import 'dart:async';

import 'package:meet_note_core/models/task.dart';
import 'package:uuid/uuid.dart';

abstract class TaskService {
  Stream<List<Task>> getAll();

  Future<bool> delete(String id);

  Future<bool> update(Task updatedTask);

  Future<void> create(String title);
}

class TaskServiceImpl implements TaskService {
  final _taskList = List<Task>();

  StreamController<List<Task>> _taskController = StreamController<List<Task>>();

  TaskServiceImpl();

  @override
  Future<void> create(String title) {
    Task task = Task(
      id: Uuid().v4(),
      title: title,
      isDone: false,
      createdAt: DateTime.now(),
    );

    _taskList.add(task);
    _taskController.add(_taskList);
    return Future.value();
  }

  @override
  Future<bool> update(Task updatedTask) {
    _taskList.removeWhere((task) => task.id == updatedTask.id);
    _taskList.add(updatedTask);

    _taskController.add(_taskList);
    return Future.value();
  }

  @override
  Future<bool> delete(String id) {
    Task deletedTask =
        _taskList.firstWhere((task) => task.id == id, orElse: () => null);

    bool success = _taskList.remove(deletedTask);

    if (success) {
      _taskController.add(_taskList);
    }
    return Future.value(success);
  }

  @override
  Stream<List<Task>> getAll() {
    _taskController.add(_taskList);
    return _taskController.stream;
  }
}
