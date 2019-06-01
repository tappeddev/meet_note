import 'models/task.dart';

String monthAbbreviation(int month) {
  assert(month >= 1 && month <= 12);

  return [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "June",
    "July",
    "Aug",
    "Sept",
    "Oct",
    "Nov",
    "Dec",
  ][month - 1]
      .toUpperCase();
}

List<Task> sortTasks(List<Task> tasks) {
  return List.of(tasks)
    ..sort((lhs, rhs) {
      if (lhs.isDone) return 1;
      if (rhs.isDone) return 0;

      return lhs.createdAt.compareTo(rhs.createdAt);
    });
}
