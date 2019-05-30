import 'dart:async';

import 'package:angular/angular.dart';
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
    ])
class TodoListComponent implements OnInit, OnDestroy {
  TaskListViewModel viewModel;
  StreamSubscription<TaskListState> stateSubscription;
  TaskListState state;

  @override
  void ngOnInit() {
    viewModel = TaskListViewModel(null);
    stateSubscription = viewModel.state.listen((newState) => state = newState);
  }

  @override
  void ngOnDestroy() {
    stateSubscription.cancel();
  }
}
