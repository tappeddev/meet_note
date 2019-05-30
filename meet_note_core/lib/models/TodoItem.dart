import 'package:meta/meta.dart';

@immutable
class TodoItem {
  final String id;
  final String todo;
  final bool done;

  TodoItem({this.id, this.todo, this.done});
}
