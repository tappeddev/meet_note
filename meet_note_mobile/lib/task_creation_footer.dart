import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubmitTextField extends StatefulWidget {
  final String text;
  final bool createButtonEnabled;
  final VoidCallback onSubmit;
  final ValueChanged<String> onTextChanged;

  SubmitTextField({
    @required this.text,
    @required this.createButtonEnabled,
    @required this.onSubmit,
    @required this.onTextChanged,
  });

  @override
  _SubmitTextFieldState createState() => _SubmitTextFieldState();
}

class _SubmitTextFieldState extends State<SubmitTextField> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffefeef0),
      ),
      child: Row(
        children: [
          SizedBox(width: 8),
          Expanded(child: _buildTextField()),
          SizedBox(width: 16),
          _buildSubmitButton()
        ],
      ),
    );
  }

  // -----
  // Widget Builders
  // -----

  Widget _buildTextField() {
    _setTextIfNeeded();

    return TextField(
      onChanged: widget.onTextChanged,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "What's on your mind?",
          contentPadding: EdgeInsets.all(8)),
      controller: _textController,
    );
  }

  Widget _buildSubmitButton() {
    final color = widget.createButtonEnabled
        ? Theme.of(context).primaryColor
        : const Color(0xffb5b3b5);

    final border = BorderRadius.only(
      bottomRight: Radius.circular(16),
      bottomLeft: Radius.circular(8),
      topRight: Radius.circular(16),
      topLeft: Radius.circular(8),
    );

    return InkWell(
      onTap: widget.createButtonEnabled ? widget.onSubmit : null,
      child: Container(
        width: 64,
        height: 64,
        alignment: Alignment.center,
        child: Icon(Icons.add, color: Colors.white, size: 30),
        decoration: BoxDecoration(color: color, borderRadius: border),
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
}
