import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/blocs/add_task/bloc/add_task_bloc.dart';
import 'package:to_do_list_app/blocs/tasks/bloc/tasks_bloc.dart';
import 'package:to_do_list_app/widgets/add_task_form.dart';
import 'package:to_do_list_app/widgets/custom_button.dart';
import 'package:to_do_list_app/widgets/custom_text_field.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (context) => AddTaskBloc(),
      child: BlocConsumer<AddTaskBloc, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskSuccess) {
            BlocProvider.of<TasksBloc>(context).add(FetchTasks());
            Navigator.of(context).pop();
          } else if (state is AddTaskFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddTaskLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: SingleChildScrollView(
                child: AddTaskForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}

