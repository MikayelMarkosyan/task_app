import 'package:flutter/material.dart';
import 'package:task_app/models/task_status.dart';
import 'package:task_app/screens/task_edit_screen.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../providers/tasks.dart';

class TaskItem extends StatelessWidget {
  final Task _task;

  TaskItem(this._task);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (ctx, Tasks taskData, child) => ListTile(
        leading: CircleAvatar(child: Text('${_task.id}')),
        title: Text('${_task.title} - ${_task.status.name}'),
        subtitle: Text(_task.description),
        trailing: Wrap(children: [
          if(_task.status == TaskStatus.Active)
            IconButton(
              //changing task status to completed
              icon: const Icon(Icons.forward),
              alignment: Alignment.bottomRight,
              onPressed: () {
                _task.status = TaskStatus.Completed;
                taskData.updateItem(_task);
              },
            ),
          IconButton(
            icon: const Icon(Icons.edit),
            alignment: Alignment.bottomRight,
            onPressed: () {
              Navigator.of(context).pushNamed(TaskEditScreen.routName, arguments: _task.id);
            },
          ),
          //Only completed tasks can be delete.
          if(_task.status == TaskStatus.Completed)
          IconButton(
            icon: const Icon(Icons.delete),
            alignment: Alignment.bottomRight,
            onPressed: () {
              taskData.removeItem(_task);
            },
          ),
        ],
        ),
      ),
    );
  }
}
