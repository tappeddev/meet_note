import 'package:meet_note_core/models/task.dart';
import 'package:meet_note_core/service/task_service.dart';
import 'package:stateful_view_model/stateful_view_model.dart';

class TaskListState implements Cloneable<TaskListState> {
  String currentYear;
  String currentDay;

  List<Task> taskList;

  @override
  TaskListState copy() {
    // TODO: implement copy
    return null;
  }
}

class TaskListViewModel extends StatefulViewModel<TaskListState> {
  final TaskService _taskService;

  TaskListViewModel(this._taskService, [TaskListState initialState])
      : super(initialState);

  void createTask(String title) {
    //TODO
  }
}
