import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/models/task_status.dart';
import 'package:task_app/providers/tasks.dart';
import 'package:task_app/widgets/task_item.dart';

class TasksList extends StatelessWidget {

  final TaskStatus? _selectedTaskStatus;

  TasksList(this._selectedTaskStatus);

  @override
  Widget build(BuildContext context) {
    final Tasks tasksData = Provider.of<Tasks>(context);
    List<Task> filteredTasks = _selectedTaskStatus != null ?  tasksData.getItemsByStatus(_selectedTaskStatus!) : tasksData.items;
    return  Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child: ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: filteredTasks.length,
      itemBuilder: (ctx, i) => TaskItem(filteredTasks[i]),
    ));
  }
}
