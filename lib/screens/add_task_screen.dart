import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:task/widgets/custome_textfield.dart';
import 'package:uuid/uuid.dart';

import '../controllers/task_bloc.dart';
import '../controllers/task_event.dart';
import '../model/task_schema.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String titleError = '';
  String descriptionError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
        backgroundColor: const Color(0xFFEAC4B2),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              controller: titleController,
              labelText: 'Title',
              errorText: titleError,
            ),
            const SizedBox(height: 10.0,),
            CustomTextField(
              controller: descriptionController,
              labelText: 'Description',
              errorText: descriptionError,
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _validateAndAddTask,
                    child: const Text('Add Task'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _validateAndAddTask() {
    final title = titleController.text;
    final description = descriptionController.text;

    setState(() {
      titleError = title.isEmpty ? 'Title cannot be empty' : '';
      descriptionError = description.isEmpty ? 'Description cannot be empty' : '';
    });

    if (title.isNotEmpty && description.isNotEmpty) {
      final task = Task(
        title: title,
        description: description,
        id: Uuid().v1().toString(),
      );
      BlocProvider.of<TaskBloc>(context).add(AddTask(task));
      Get.back();
    }
  }
}
