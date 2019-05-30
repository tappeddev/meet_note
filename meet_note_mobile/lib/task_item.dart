import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meet_note_core/models/task.dart';

class TaskItem extends StatefulWidget {
  final Task task;
  final ValueChanged onChecked;

  TaskItem({@required this.task, @required this.onChecked});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final isDone = widget.task.isDone;

    var textStyle = Theme.of(context).textTheme.subhead;

    if (isDone) {
      textStyle = textStyle.copyWith(
        color: textStyle.color.withOpacity(.5),
        decoration: TextDecoration.lineThrough,
      );
    }

    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 48),
      child: Row(
        children: [
          Text(widget.task.title),
          Checkbox(onChanged: widget.onChecked, value: isDone)
        ],
      ),
    );
  }
}
