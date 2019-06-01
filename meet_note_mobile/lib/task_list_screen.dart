import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:meet_note_core/models/task.dart';
import 'package:meet_note_core/view_model/task_list_view_model.dart';
import 'package:meet_note_mobile/meet_note_app_bar.dart';
import 'package:meet_note_mobile/submit_text_field.dart';
import 'package:meet_note_mobile/task_item.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TaskListViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = Injector.appInstance.getDependency<TaskListViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TaskListState>(
      stream: _viewModel.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        return buildState(context, snapshot.data);
      },
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  // -----
  // Widget Builders
  // -----

  Widget buildState(BuildContext context, TaskListState state) {
    return Scaffold(
      appBar: MeetNoteAppBar(
        day: state.day,
        month: state.month,
        year: state.year,
      ),
      resizeToAvoidBottomPadding: true,
      body: Column(
        children: [
          Expanded(
            child: ListView(children: [
              SizedBox(height: 32),
              ...state.taskList.map(_createTaskItem).toList(),
            ]),
          ),
          SubmitTextField(
            text: state.taskName,
            createButtonEnabled: state.createTaskButtonIsEnabled,
            onTextChanged: _viewModel.validateTaskName,
            onSubmit: _viewModel.createTask,
          ),
        ],
      ),
    );
  }

  Widget _createTaskItem(Task task) {
    return TaskItem(task: task, onTab: () => _viewModel.toggleTask(task.id));
  }
}
