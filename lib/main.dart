import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/providers/tasks.dart';
import 'package:task_app/screens/task_edit_screen.dart';
import 'package:task_app/screens/tasks_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Tasks>(
      create: (ctx) =>  Tasks(),
      child: MaterialApp(
        title: 'Task App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: TasksOverviewScreen(),
        routes: {
            TaskEditScreen.routName:  (_) => TaskEditScreen()
        },
      ),
    );
  }
}
