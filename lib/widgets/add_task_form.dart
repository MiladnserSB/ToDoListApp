import 'package:flutter/material.dart';
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
  String? title;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
            maxLines: 5,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomButton(
            title: 'Add',
            onTap: () {
              if (formKey.currentState!.validate()) {
                print('object');
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(
                  () {},
                );
              }
              ;
            },
          ),
        ],
      ),
    );
  }
}
