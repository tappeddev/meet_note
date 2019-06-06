import 'package:meet_note_core/service/task_service.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';
import 'package:test/test.dart';

void main() {
  TaskListViewModel viewModel;

  Stream<R> streamOf<R>(R Function(TaskListState state) mapper) =>
      viewModel.state.map(mapper).distinct();

  setUp(() {
    viewModel = TaskListViewModel(TaskServiceImpl());
  });

  test("state contains day, month and year", () {
    expect(viewModel.state.map((state) => state.day.isNotEmpty), emits(true));
    expect(viewModel.state.map((state) => state.month.isNotEmpty), emits(true));
    expect(viewModel.state.map((state) => state.year.isNotEmpty), emits(true));
  });

  test("button is enabled if task name was set", () {
    viewModel.setTaskName("Create Tests");
    expect(
      viewModel.state.map((state) => state.isCreateButtonEnabled),
      emits(true),
    );
  });

  test("toggled task marks task as done", () async {
    viewModel.setTaskName("New task");
    viewModel.createTask();

    final taskList = await viewModel.state
        .map((state) => state.taskList)
        .firstWhere((tasks) => tasks.isNotEmpty);

    final task = taskList.first;

    viewModel.toggleTask(task.id);

    final state = await viewModel.state
        .firstWhere((state) => state.taskList.first.isDone);

    expect(state.taskList.first.isDone, true);
  });

  test("create task clears textfield", () async {
    viewModel.setTaskName("Super valid task name");
    viewModel.createTask();

    final newTaskTitle = streamOf((state) => state.taskList)
        .where((list) => list.isNotEmpty)
        .map((list) => list.first.title);

    expect(newTaskTitle, emits("Super valid task name"));

    final taskName = streamOf((state) => state.taskName);
    expect(taskName, emits(""));

    final isButtonEnabled = streamOf((state) => state.isCreateButtonEnabled);
    expect(isButtonEnabled, emits(false));
  });
}
