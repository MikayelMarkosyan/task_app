import 'package:flutter/material.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/task_status.dart';
import 'package:task_app/screens/task_edit_screen.dart';
import 'package:task_app/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import '../providers/tasks.dart';

class TasksOverviewScreen extends StatefulWidget {
  @override
  State<TasksOverviewScreen> createState() {
    return _TasksOverviewScreenState();
  }
}

class _TasksOverviewScreenState extends State<TasksOverviewScreen> {

  TaskStatus? _selectedStatus;
  late Task _task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks Overview', textAlign: TextAlign.left),
        actions: [
          IconButton(onPressed: () {
             //during create task passing  negative taskId
              Navigator.of(context).pushNamed(TaskEditScreen.routName,  arguments: -1);
          }, icon: const Icon(Icons.add),)
        ],
      ),
      body:    Column(children: [
        Container(
          padding: const EdgeInsets.all(10) ,
          color: const Color.fromRGBO(233, 239, 239, 1.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: _selectedStatus == null
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5))),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedStatus = null;
                    });
                  },
                  child: Text(
                    'ALL',
                    style: TextStyle(
                        color: _selectedStatus == null
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
              Container(
                color: _selectedStatus == TaskStatus.Active
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedStatus = TaskStatus.Active;
                    });
                  },
                  child: Text(
                    'Active',
                    style: TextStyle(
                        color: _selectedStatus == TaskStatus.Active
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: _selectedStatus == TaskStatus.Completed
                        ? Theme.of(context).primaryColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedStatus = TaskStatus.Completed;
                    });
                  },
                  child: Text(
                    'Completed',
                    style: TextStyle(
                        color: _selectedStatus == TaskStatus.Completed
                            ? Colors.white
                            : Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        TasksList(_selectedStatus)
      ])
    );
  }
}
