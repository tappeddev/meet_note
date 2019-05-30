import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskCreationFooter extends StatelessWidget {
  final ValueChanged<String> onSubmit;

  TaskCreationFooter({@required this.onSubmit});

  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(bottom: 32, right: 48, left: 48),
      child: Row(
        children: [
          Expanded(child: TextField(controller: textEditingController)),
          SizedBox(width: 16),
          Material(
            elevation: 0,
            shape: CircleBorder(),
            child: InkWell(
                borderRadius: BorderRadius.circular(40),
                child: Container(
                  height: 40,
                  width: 40,
                  child: Icon(Icons.add, color: Colors.white),
                ),
                onTap: () => onSubmit(textEditingController.text)),
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
