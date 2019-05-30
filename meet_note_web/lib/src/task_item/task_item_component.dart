import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:meet_note_web/src/checkbox/checkbox_component.dart';

@Component(
  selector: "task-item",
  templateUrl: "task_item_component.html",
  styleUrls: ["task_item_component.css"],
  directives: [CheckboxComponent],
)
class TaskItemComponent {
  final _onIsDoneChangedController = StreamController<void>();

  @Input()
  String title;

  @Input()
  bool isDone;

  @Output("isDoneChanged")
  Stream<void> get onIsDoneChanged => _onIsDoneChangedController.stream;

  @HostBinding("class.isDone")
  bool get isDoneClass => isDone;

  void onCheckboxIsCheckedChange() => _onIsDoneChangedController.add(null);
}
