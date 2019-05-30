import 'package:meta/meta.dart';

@immutable
class Task {
  final String id;
  final String title;
  final bool done;

  Task({this.id, this.title, this.done});
}