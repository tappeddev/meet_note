import 'package:meet_note_core/models/task.dart';
import 'package:meet_note_core/service/task_service.dart';
import 'package:stateful_view_model/stateful_view_model.dart';

class TaskListState implements Cloneable<TaskListState> {
  String year;
  String day;
  String month;

  List<Task> taskList;

  TaskListState(this.year, this.day, this.month, this.taskList);

  factory TaskListState.initial() => TaskListState("", "", "", []);

  @override
  TaskListState copy() => TaskListState(day, month, year, List.of(taskList));
}

class TaskListViewModel extends StatefulViewModel<TaskListState> {
  final TaskService _taskService;

  TaskListViewModel(this._taskService, [TaskListState initialState])
      : super(initialState ?? TaskListState.initial()) {
    final now = DateTime.now();

    setState((state) {
      state.year = now.year.toString();
      state.month = now.month.toString();
      state.day = now.day.toString();
      return state;
    });

    disposeSubscription(_taskService.getAll().listen(_handleFetchedList));
  }

  // -----
  // Public Api
  // -----

  void createTask(String title) {
    _taskService.create(title);
  }

  void toggleTask(String taskId) {
    final task = getState()
        .taskList
        .firstWhere((task) => task.id == taskId, orElse: () => null);

    assert(task != null, "task with id $taskId not found.");

    _taskService.update(task.copyWith(isDone: !task.isDone));
  }

  // ------
  // Helper
  // ------

  void _handleFetchedList(List<Task> taskList) {
    setState((state) => state..taskList = _sortTasks(taskList));
  }

  List<Task> _sortTasks(List<Task> tasks) {
    return List.of(tasks)
      ..sort((lhs, rhs) {
        if (lhs.isDone) return 1;
        if (rhs.isDone) return 0;

        return lhs.createdAt.compareTo(rhs.createdAt);
      });
  }
}
