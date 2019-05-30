import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular/di.dart';
import 'package:meet_note_web/src/checkbox/checkbox_component.dart';

@Component(
  selector: "todo-item",
  templateUrl: "todo_item_component.html",
  styleUrls: ["todo_item_component.css"],
  directives: [CheckboxComponent],
)
class TodoItemComponent {
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
