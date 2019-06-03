import 'dart:ui';

const fontColor = const Color(0xFF5B5F6A);


/**
 * 
 * class TaskListScreen extends StatefulWidget {
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


// ----
// Item
// ----

class TaskItem extends StatefulWidget {
  final Task task;
  final VoidCallback onTab;

  TaskItem({@required this.task, @required this.onTab});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final isDone = widget.task.isDone;

    var textStyle =
        Theme.of(context).textTheme.subhead.copyWith(color: fontColor);

    if (isDone) {
      textStyle = textStyle.copyWith(
        color: textStyle.color.withOpacity(.5),
        decoration: TextDecoration.lineThrough,
      );
    }

    return Material(
      child: InkWell(
        onTap: _onTab,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Row(
            children: [
              Expanded(child: Text(widget.task.title, style: textStyle)),
              SizedBox(width: 8),
              MeetNoteCheckBox(
                onChanged: (_) => _onTab(),
                isChecked: isDone,
              )
            ],
          ),
        ),
      ),
    );
  }

  // -----
  // Helper
  // -----

  void _onTab() {
    HapticFeedback.lightImpact();
    widget.onTab();
  }
}




 */

