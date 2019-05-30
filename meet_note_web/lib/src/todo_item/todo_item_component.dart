import 'package:angular/di.dart';
import 'package:meet_note_web/src/checkbox/checkbox_component.dart';

@Component(
  selector: "todo-item",
  templateUrl: "todo_item_component.html",
  styleUrls: ["todo_item_component.css"],
  directives: [CheckboxComponent],
)
class TodoItemComponent {
  @Input()
  String title;

  @Input()
  bool done;
}
