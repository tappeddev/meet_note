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
  TaskListState state;

  StreamSubscription<TaskListState> _stateSubscription;
  StreamSubscription<KeyboardEvent> _keyboardSubscription;

  @override
  void ngOnInit() {
    // Get the view model from the injector.
    viewModel =
        injector.Injector.appInstance.getDependency<TaskListViewModel>();

    // Listen to state updates
    // and update the state of this component accordingly.
    _stateSubscription = viewModel.state.listen((newState) => state = newState);
    state = viewModel.initialState;

    // Create a task when the enter key gets pressed.
    _keyboardSubscription = document.onKeyPress.listen((KeyboardEvent event) {
      if (event.key == "Enter") viewModel.createTask();
    });
  }

  @override
  void ngOnDestroy() {
    // Cancel all open subscriptions to avoid memory leaks.
    _stateSubscription.cancel();
    _keyboardSubscription.cancel();
  }
}
