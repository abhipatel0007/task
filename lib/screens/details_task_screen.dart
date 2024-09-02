import 'package:flutter/material.dart';

import '../model/task_schema.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
        backgroundColor: const Color(0xFFEAC4B2),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${task.title}', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Description: ${task.description ?? 'No description'}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}