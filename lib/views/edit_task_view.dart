import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditTaskViewBody(),
    );
  }
}