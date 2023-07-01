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
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    List<Task> filteredTasks = _selectedTaskStatus != null ?  tasksData.getItemsByStatus(_selectedTaskStatus!) : tasksData.items;
    return  Container(
        height:isPortrait ? MediaQuery.of(context).size.height * 0.7 : MediaQuery.of(context).size.height * 0.6,
        child: filteredTasks.isNotEmpty? ListView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: filteredTasks.length,
      itemBuilder: (ctx, i) => TaskItem(filteredTasks[i]),
    ):  ListView(children: [
          const ListTile(
             title: const Text('NO DATA'),
          )
        ],));
  }
}
