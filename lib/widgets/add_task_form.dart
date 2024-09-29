import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list_app/blocs/add_task/bloc/add_task_bloc.dart';
import 'package:to_do_list_app/models/task_model.dart';
import 'package:to_do_list_app/widgets/custom_button.dart';
import 'package:to_do_list_app/widgets/custom_text_field.dart';

class AddTaskForm extends StatefulWidget {
  AddTaskForm({
    super.key,
  });

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 35,
          ),
          BlocBuilder<AddTaskBloc, AddTaskState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: CustomButton(
                  isLoading: state is AddTaskLoading ? true : false,
                  title: 'Add',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var currentDate = DateTime.now();
                      var currentFormattedDate =
                          DateFormat.yMd().format(currentDate);
                      var taskModel = TaskModel(
                        title: title!,
                      );
                      BlocProvider.of<AddTaskBloc>(context)
                          .add(AddTask(taskModel));
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(
                        () {},
                      );
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
