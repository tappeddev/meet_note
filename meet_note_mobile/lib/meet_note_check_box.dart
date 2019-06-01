import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meet_note_mobile/color.dart';

class MeetNoteCheckBox extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  MeetNoteCheckBox({@required this.isChecked, @required this.onChanged});

  @override
  _MeetNoteCheckBoxState createState() => _MeetNoteCheckBoxState();
}

class _MeetNoteCheckBoxState extends State<MeetNoteCheckBox>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      child: Icon(
        Icons.check,
        color: widget.isChecked ? Colors.white : Colors.transparent,
        size: 18,
      ),
      decoration: BoxDecoration(
        color: widget.isChecked ? primaryColor : Colors.transparent,
        border: Border.all(color: widget.isChecked ? primaryColor : fontColor),
        shape: BoxShape.circle,
      ),
    );
  }
}
