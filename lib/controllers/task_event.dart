// task_event.dart


import '../model/task_schema.dart';

abstract class TaskEvent {}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);
}

class DeleteTask extends TaskEvent {
  final String id;

  DeleteTask(this.id);
}
