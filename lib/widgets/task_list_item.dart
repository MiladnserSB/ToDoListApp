import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/blocs/tasks/bloc/tasks_bloc.dart';
import 'package:to_do_list_app/models/task_model.dart';
import 'package:to_do_list_app/widgets/task_item.dart';

class TaskListItems extends StatelessWidget {
  const TaskListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TasksBloc>(context).tasks ?? [];
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right:25,bottom:60),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskItem(task: tasks[index],);
              },
              padding: EdgeInsets.zero,
            ),
          ),
        );
      },
    );
  }
}
