import 'dart:async';
import 'dart:html';

import 'package:injector/injector.dart' as injector;
import 'package:angular/angular.dart';
import 'package:meet_note_web/src/date_component/date_component.dart';
import 'package:meet_note_web/src/task_item/task_item_component.dart';
import 'package:meet_note_web/src/text_field/text_field_component.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';

@Component(
    selector: 'task-list',
    templateUrl: 'task_list_component.html',
    styleUrls: [
      'task_list_component.css'
    ],
    directives: [
      TaskItemComponent,
      NgFor,
      DateComponent,
      TextFieldComponent,
    ])
class TaskListComponent implements OnInit, OnDestroy {
  TaskListViewModel viewModel;
  StreamSubscription<TaskListState> stateSubscription;
  StreamSubscription<KeyboardEvent> keyboardSubscription;
  TaskListState state;

  @override
  void ngOnInit() {
    viewModel =
        injector.Injector.appInstance.getDependency<TaskListViewModel>();
    stateSubscription = viewModel.state.listen((newState) => state = newState);
    state = viewModel.initialState;

    keyboardSubscription = document.onKeyPress.listen((KeyboardEvent event) {
      if (event.keyCode == 13) {
        viewModel.createTask();
      }
    });
  }

  @override
  void ngOnDestroy() {
    stateSubscription.cancel();
    keyboardSubscription.cancel();
  }

  void onTaskCreationTextFieldChange(String newInput) =>
      viewModel.validateTaskName(newInput);

  void onTaskItemIsDoneChange(String taskId) => viewModel.toggleTask(taskId);

  void onCreateTaskButtonClick() => viewModel.createTask();
}
