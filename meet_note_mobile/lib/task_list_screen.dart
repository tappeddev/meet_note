import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';


class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen>  {

  TaskListViewModel _taskListViewModel;

  @override
  void initState() {
    super.initState();
    //TODO
    _taskListViewModel = null;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _taskListViewModel.state,
      builder: (context, snapshot){

        if(!snapshot.hasData){
          return Container();
        }

        return Scaffold(
          appBar: AppBar(),
        );
      },
    );
  }
}
