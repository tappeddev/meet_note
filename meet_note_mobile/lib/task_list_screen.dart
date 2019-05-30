import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_note_core/service/task_service.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';

import 'package:injector/injector.dart';

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

        var state = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text("Test"),
          ),
          body: ListView(
            children: _buildList(state),
          ),
          bottomNavigationBar: Container(
            height: 80,
            width: double.infinity,
            color: Colors.redAccent,
          ),
        );
      },
    );
  }

  List<Widget> _buildList(TaskListState state) {
    return [];
  }
}
