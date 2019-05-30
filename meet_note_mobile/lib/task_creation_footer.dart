import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meet_note_mobile/color.dart';

class TaskCreationFooter extends StatefulWidget {
  final ValueChanged<String> onSubmit;

  TaskCreationFooter({@required this.onSubmit});

  @override
  _TaskCreationFooterState createState() => _TaskCreationFooterState();
}

class _TaskCreationFooterState extends State<TaskCreationFooter> {
  bool _shadowEnabled = false;

  final _textEditingController = TextEditingController();

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
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16),
                hintText: "What's on your mind?",
                border: OutlineInputBorder(),
                fillColor: fontColor,
              ),
              controller: _textEditingController,
            ),
          ),
          SizedBox(width: 16),
          Material(
            elevation: 0.0,
            shape: CircleBorder(),
            child: InkWell(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                onTap: () => widget.onSubmit(_textEditingController.text)),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  // -----
  // Helper
  // -----

  BoxShadow get _shadow => BoxShadow(
      color: Colors.black.withOpacity(.1),
      spreadRadius: 10,
      blurRadius: 10,
      offset: Offset(0, -1));
}
