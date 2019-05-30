import 'package:meet_note_core/models/task.dart';

abstract class TaskService {
  Future<List<Task>> getAll();

  Future<bool> delete(String id);

  Future<void> create(String title);
}

class TaskServiceImpl implements TaskService {
  @override
  Future<void> create(String title) {
    return Future.value();
  }

  @override
  Future<bool> delete(String id) {
    return Future.value(false);
  }

  @override
  Future<List<Task>> getAll() {
    return Future.value([
      Task(title: "ddd", id: "uuid", done: true),
      Task(title: "gggf", id: "uuid", done: false),
      Task(title: "asds", id: "uuid", done: true),
      Task(title: "dffd", id: "uuid", done: false),
      Task(title: "dfhh", id: "uuid", done: false),
      Task(title: "jjjhj", id: "uuid", done: true),
      Task(title: "hhzh", id: "uuid", done: false)
    ]);
  }
}
