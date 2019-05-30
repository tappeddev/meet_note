
abstract class TaskService {

  Future<List<TaskService>> getAll();

  Future<bool> delete(String id);

  Future<void> create(String title);
}