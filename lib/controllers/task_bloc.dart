

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/controllers/task_event.dart';
import 'package:task/controllers/task_state.dart';

import '../repositories/task_repositories.dart';


class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskDatabase taskDatabase;

  TaskBloc(this.taskDatabase) : super(TaskInitial()) {
    on<LoadTasks>((event, emit) async {
      final tasks = await taskDatabase.getTasks();
      emit(TasksLoaded(tasks));
    });

    on<AddTask>((event, emit) async {
      await taskDatabase.insertTask(event.task);
      add(LoadTasks());
    });

    on<DeleteTask>((event, emit) async {
      await taskDatabase.deleteTask(event.id);
      add(LoadTasks());
    });
  }
}
