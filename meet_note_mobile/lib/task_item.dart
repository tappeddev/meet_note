import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meet_note_core/models/task.dart';
import 'package:meet_note_mobile/color.dart';
import 'package:meet_note_mobile/meet_note_check_box.dart';

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
