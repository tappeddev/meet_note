import 'package:angular/angular.dart';
import 'package:meet_note_web/src/todo_item/todo_item_component.dart';

@Component(
    selector: 'todo-list',
    templateUrl: 'todo_list_component.html',
    styleUrls: ['todo_list_component.css'],
    directives: [TodoItemComponent])
class TodoListComponent {

}
