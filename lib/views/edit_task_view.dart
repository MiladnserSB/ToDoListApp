import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task_model.dart';
import 'package:to_do_list_app/widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.task});
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditTaskViewBody(task: task,),
    );
  }
}