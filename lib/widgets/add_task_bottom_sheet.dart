import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/custom_button.dart';
import 'package:to_do_list_app/widgets/custom_text_field.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatelessWidget {
  AddNoteForm({
    super.key,
  });
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const CustomTextField(
            hint: 'Title',
            maxLines: 5,
          ),
          const SizedBox(
            height: 35,
          ),
          CustomButton(
              title: 'Add',
              onTap: () {
                // print('object');
              })
        ],
      ),
    );
  }
}
