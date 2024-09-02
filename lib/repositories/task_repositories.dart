import 'package:shared_preferences/shared_preferences.dart';

import '../model/task_schema.dart';

class TaskDatabase {
  static const String _tasksKey = 'tasks';

  Future<List<Task>> getTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskStrings = prefs.getStringList(_tasksKey) ?? [];
    return taskStrings.map((taskString) => Task.fromJson(taskString)).toList();
  }

  Future<void> insertTask(Task task) async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = await getTasks();
    final newTasks = List<Task>.from(tasks)..add(task);
    final taskStrings = newTasks.map((task) => task.toJson()).toList();
    await prefs.setStringList(_tasksKey, taskStrings);
  }

  Future<void> deleteTask(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final tasks = await getTasks();
    // Remove only the task with the matching id
    final newTasks = tasks.where((task) => task.id != id).toList();
    final taskStrings = newTasks.map((task) => task.toJson()).toList();
    await prefs.setStringList(_tasksKey, taskStrings);
  }
}
