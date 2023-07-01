import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';
import '../providers/tasks.dart';

class TaskEditScreen extends StatefulWidget {
  static const String routName = '/task-edit';

  @override
  State<TaskEditScreen> createState() {
    return _TaskEditScreenState();
  }
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  late Task _task;
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int taskId = ModalRoute.of(context)!.settings.arguments as int;
    taskId < 0
        ? _task = new Task(-1, '', '')
        : _task = Provider.of<Tasks>(context).getItemById(taskId);
    _titleController.text = _task.title;
    _descriptionController.text = _task.description;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Task Create/Edit',
          textAlign: TextAlign.left,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close),
          ),
          IconButton(
            onPressed: () {
              _onSaveForm(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                validator: (value) {
                  return (value == null || value.isEmpty || value.trim().isEmpty) ? 'Title is required' : null;
                },
                onSaved: (_) {
                  _task.title = _titleController.text;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                controller: _descriptionController,
                onSaved: (_) {
                  _task.description = _descriptionController.text;
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onSaveForm(BuildContext context) {
    _form.currentState?.save();
    final isValid =  _form.currentState?.validate();
    if(isValid == null || !isValid) {
      return;
    }
    if (_task.id < 0) {
      Provider.of<Tasks>(context, listen: false).createNewItem(_task);
    } else {
      Provider.of<Tasks>(context, listen: false).updateItem(_task);
    }
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
