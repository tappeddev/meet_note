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
  List<Task> _taskList = [
    Task(id: "1", title: "get shit done", isDone: false),
    Task(id: "2", title: "finish presentation", isDone: false),
    Task(id: "3", title: "tell meetup dude that we are awesome", isDone: false),
    Task(id: "4", title: "release tikkr alpha", isDone: true),
  ];
  StreamController<List<Task>> _taskController = StreamController<List<Task>>();

  TaskServiceImpl();

  @override
  Future<void> create(String title) {
    Task task = Task(
      id: Uuid().v4(),
      title: title,
      isDone: false,
    );

    _taskList.add(task);
    _taskController.add(_taskList);
    return Future.value();
  }

  @override
  Future<bool> update(Task updatedTask) {
    Task oldTask = _taskList.firstWhere((task) => task.id == updatedTask.id,
        orElse: () => throw Error());

    oldTask = updatedTask;

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
