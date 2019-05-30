import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:meet_note_core/models/task.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';
import 'package:meet_note_mobile/meet_note_app_bar.dart';
import 'package:meet_note_mobile/task_item.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TaskListViewModel _taskListViewModel;

  @override
  void initState() {
    super.initState();
    _taskListViewModel =
        Injector.appInstance.getDependency<TaskListViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _taskListViewModel.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return buildState(context, snapshot.data);
      },
    );
  }

  // -----
  // Widget Builders
  // -----

  Widget buildState(BuildContext context, TaskListState state) {
    return Scaffold(
      appBar: MeetNoteAppBar(),
      body: ListView(children: _buildList(state.taskList)),
    );
  }

  List<Widget> _buildList(List<Task> tasks) {
    return tasks
        .map((task) => TaskItem(task: task, onChecked: (_) {}))
        .toList();
  }
}
