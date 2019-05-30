import 'dart:async';

import 'package:meet_note_core/models/task.dart';
import 'package:uuid/uuid.dart';

abstract class TaskService {
  Stream<List<Task>> getAll();

  Future<bool> delete(String id);

  Future<bool> update(Task task);

  Future<void> create(String title);
}

class TaskServiceImpl implements TaskService {
  List<Task> _taskList = List();

  StreamController<Task> sdsd;

  @override
  Future<void> create(String title) {
    Task task = Task(
      id: Uuid().v4(),
      title: title,
      done: false,
    );

    _taskList.add(task);

    return Future.value();
  }

  @override
  Future<bool> update(Task task) {
    return Future.value();
  }

  @override
  Future<bool> delete(String id) {
    return Future.value(false);
  }

  @override
  Stream<List<Task>> getAll() {
    return Stream.fromFuture(Future.value([
      Task(title: "ddd", id: "uuid", done: true),
      Task(title: "gggf", id: "uuid", done: false),
      Task(title: "asds", id: "uuid", done: true),
      Task(title: "dffd", id: "uuid", done: false),
      Task(title: "dfhh", id: "uuid", done: false),
      Task(title: "jjjhj", id: "uuid", done: true),
      Task(title: "hhzh", id: "uuid", done: false)
    ]));
  }
}
