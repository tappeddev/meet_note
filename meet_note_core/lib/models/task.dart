import 'package:meta/meta.dart';

@immutable
class Task {
  final String id;
  final String title;
  final bool isDone;
  final DateTime createdAt;

  Task({
    @required this.id,
    @required this.title,
    @required this.isDone,
    @required this.createdAt,
  });

  Task copyWith({String title, bool isDone}) => Task(
        id: id,
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        createdAt: createdAt,
      );
}
