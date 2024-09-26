import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/custom_app_bar.dart';

class EditTaskViewBody extends StatelessWidget {
  const EditTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        
        CustomAppBar(title: 'title')
      ],
    );
  }
}