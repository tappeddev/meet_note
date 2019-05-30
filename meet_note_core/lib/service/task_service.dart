
import 'package:meet_note_core/models/task.dart';

abstract class TaskService {

  Future<List<Task>> getAll();

  Future<bool> delete(String id);

  Future<void> create(String title);
}

class TaskServiceImpl implements TaskService {

  @override
  Future<void> create(String title) {
    // TODO: implement create
    return null;
  }

  @override
  Future<bool> delete(String id) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<List<Task>> getAll() {
    // TODO: implement getAll
    return null;
  }
}