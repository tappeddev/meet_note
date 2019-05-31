import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meet_note_mobile/color.dart';

class TaskCreationFooter extends StatefulWidget {
  final String text;
  final bool createButtonEnabled;
  final VoidCallback onSubmit;
  final ValueChanged<String> onTextChanged;

  TaskCreationFooter({
    @required this.text,
    @required this.createButtonEnabled,
    @required this.onSubmit,
    @required this.onTextChanged,
  });

  @override
  _TaskCreationFooterState createState() => _TaskCreationFooterState();
}

class _TaskCreationFooterState extends State<TaskCreationFooter> {
  bool _shadowEnabled = false;

  final _textController = TextEditingController();

  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() => _shadowEnabled = _focusNode.hasFocus);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _setTextIfNeeded();

    return Container(
      height: 92,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: _shadowEnabled ? [_shadow] : []),
      padding: EdgeInsets.only(bottom: 24, right: 48, left: 48 - 4.0, top: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: _focusNode,
              onChanged: widget.onTextChanged,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                hintText: "What's on your mind?",
                border: OutlineInputBorder(),
                fillColor: fontColor,
              ),
              controller: _textController,
            ),
          ),
          SizedBox(width: 16),
          Material(
            elevation: 0.0,
            shape: CircleBorder(),
            child: InkWell(
                borderRadius: BorderRadius.circular(40),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  height: widget.createButtonEnabled ? 40 : 0,
                  width: widget.createButtonEnabled ? 40 : 0,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                onTap: widget.onSubmit),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  // -----
  // Helper
  // -----

  void _setTextIfNeeded() {
    if (_textController.text == widget.text) return;

    var cursorPos = _textController.selection;

    _textController.text = widget.text;

    if (cursorPos.start > _textController.text.length) {
      cursorPos = TextSelection.fromPosition(
          TextPosition(offset: _textController.text.length));
    }

    _textController.selection = cursorPos;
  }

  BoxShadow get _shadow => BoxShadow(
      color: Colors.black.withOpacity(.1),
      spreadRadius: 10,
      blurRadius: 10,
      offset: Offset(0, -1));
}
