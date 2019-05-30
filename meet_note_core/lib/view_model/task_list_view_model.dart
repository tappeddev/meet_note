import 'package:meet_note_core/models/task.dart';
import 'package:meet_note_core/service/task_service.dart';
import 'package:meta/meta.dart';
import 'package:stateful_view_model/stateful_view_model.dart';

class TaskListState implements Cloneable<TaskListState> {
  String year;
  String day;
  String month;

  List<Task> taskList;

  TaskListState(
      {@required this.day,
      @required this.month,
      @required this.year,
      @required this.taskList});

  factory TaskListState.initial() =>
      TaskListState(taskList: [], year: "", month: "", day: "");

  @override
  TaskListState copy() => TaskListState(
      day: day, month: month, year: year, taskList: List.of(taskList));
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

    //TODO Dispose
    _taskService.getAll().listen(_handleFetchedList);
  }

  void createTask(String title) {
    _taskService.create(title);
  }

  // ------
  // Helper
  // ------

  void _handleFetchedList(List<Task> taskList) {
    setState((state) {
      state.taskList = taskList;
      return state;
    });
  }
}
