import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task/repositories/task_repositories.dart';
import 'package:task/screens/add_task_screen.dart';
import 'package:task/screens/details_task_screen.dart';
import 'package:task/screens/task_list_screen.dart';

import 'controllers/task_bloc.dart';
import 'controllers/task_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(TaskDatabase())..add(LoadTasks()),
      child: GetMaterialApp(
        title: 'Task Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => TaskListScreen()),
          GetPage(name: '/addTask', page: () => AddTaskScreen()),
          GetPage(name: '/taskDetail', page: () => const TaskDetailScreen()),
        ],
      ),
    );
  }
}