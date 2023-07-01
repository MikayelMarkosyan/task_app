import 'task_status.dart';

class Task {
  int _id;
  String _title;
  String _description;
  TaskStatus _status;

  Task(this._id, this._title, this._description,
      [this._status = TaskStatus.Active]);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  TaskStatus get status => _status;

  set status(TaskStatus value) {
    _status = value;
  }

  Task copy() {
    return Task(_id, _title, _description, status);
  }
}
