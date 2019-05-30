import 'package:flutter/material.dart';
import 'package:meet_note_core/dependencies/register_dependencies.dart';
import 'package:meet_note_mobile/task_list_screen.dart';

void main() {
  registerDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(),
    );
  }
}
