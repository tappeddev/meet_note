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
      NgFor,
      TaskItemComponent,
      DateComponent,
      TextFieldComponent,
    ])
class TaskListComponent implements OnInit, OnDestroy {
  // TODO

  @override
  void ngOnInit() {
    // TODO
  }

  @override
  void ngOnDestroy() {
    // TODO
  }
}
