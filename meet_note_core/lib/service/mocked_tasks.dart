import 'package:meet_note_core/models/task.dart';

List<Task> get mockedTasks => [
      Task(
          id: "1",
          title: "get shit done",
          isDone: false,
          createdAt: _nowMinusMinutes(2)),
      Task(
          id: "2",
          title: "finish presentation",
          isDone: false,
          createdAt: _nowMinusMinutes(3)),
      Task(
          id: "3",
          title: "tell meetup dude that we are awesome",
          isDone: false,
          createdAt: _nowMinusMinutes(4)),
      Task(
          id: "4",
          title: "release tikkr alpha",
          isDone: true,
          createdAt: _nowMinusMinutes(5)),
    ];

DateTime _nowMinusMinutes(int minutes) =>
    DateTime.now().subtract(Duration(minutes: minutes));
