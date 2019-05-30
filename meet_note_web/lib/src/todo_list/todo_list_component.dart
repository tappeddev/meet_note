import 'dart:async';

import 'package:injector/injector.dart' as injector;
import 'package:angular/angular.dart';
import 'package:meet_note_web/src/date_component/date_component.dart';
import 'package:meet_note_web/src/text_field/text_field_component.dart';
import 'package:meet_note_web/src/todo_item/todo_item_component.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';

@Component(
    selector: 'todo-list',
    templateUrl: 'todo_list_component.html',
    styleUrls: [
      'todo_list_component.css'
    ],
    directives: [
      TodoItemComponent,
      NgFor,
      DateComponent,
      TextFieldComponent,
    ])
class TodoListComponent implements OnInit, OnDestroy {
  TaskListViewModel viewModel;
  StreamSubscription<TaskListState> stateSubscription;
  TaskListState state;

  @override
  void ngOnInit() {
    viewModel =
        injector.Injector.appInstance.getDependency<TaskListViewModel>();
    stateSubscription = viewModel.state.listen((newState) => state = newState);
    state = viewModel.initialState;
  }

  @override
  void ngOnDestroy() {
    stateSubscription.cancel();
  }

  void onTaskCreationTextFieldChange(String newInput) =>
      viewModel.validateCreateTaskInput(newInput);

  void onTaskItemIsDoneChange(String taskId) => viewModel.toggleTask(taskId);

  void onCreateTaskButtonClick() => viewModel.createTask();
}
