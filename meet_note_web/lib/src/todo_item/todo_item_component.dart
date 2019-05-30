
import 'package:angular/di.dart';

@Component(
  selector: "todo-item",
  templateUrl: "todo_item_component.html",
  styleUrls: ["todo_item_component.css"]
)
class TodoItemComponent {
  @Input()
  String todo;

  @Input()
  bool done;
}