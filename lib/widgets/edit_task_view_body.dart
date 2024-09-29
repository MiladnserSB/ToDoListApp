import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/blocs/tasks/bloc/tasks_bloc.dart';
import 'package:to_do_list_app/models/task_model.dart';
import 'package:to_do_list_app/widgets/custom_app_bar.dart';
import 'package:to_do_list_app/widgets/custom_button.dart';
import 'package:to_do_list_app/widgets/custom_text_field.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key, required this.task});
  final TaskModel task;
  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(title: 'Edit Task'),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: CustomTextField(
            hint: widget.task.title,
            onChanged: (value) {
              title = value;
            },
            maxLines: 5,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            children: [
              Expanded(
                child: CustomButton(
                    title: 'Edit',
                    onTap: () {
                      widget.task.title = title ?? widget.task.title;
                      widget.task.save();
                      BlocProvider.of<TasksBloc>(context).add(FetchTasks());
                      Navigator.pop(context);
                    }),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomButton(
                    title: 'Back',
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ),
            ],
          ),
        )
      ],
    );
  }
}
