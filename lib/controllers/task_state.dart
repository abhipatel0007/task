

import '../model/task_schema.dart';

abstract class TaskState {}

class TaskInitial extends TaskState {}

class TasksLoaded extends TaskState {
  final List<Task> tasks;

  TasksLoaded(this.tasks);
}
