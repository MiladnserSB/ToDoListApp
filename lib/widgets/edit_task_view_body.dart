import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/custom_app_bar.dart';
import 'package:to_do_list_app/widgets/custom_button.dart';
import 'package:to_do_list_app/widgets/custom_text_field.dart';

class EditTaskViewBody extends StatelessWidget {
  const EditTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        
       const CustomAppBar(title: 'Edit Task'),
       const SizedBox(
            height: 35,
          ),
       const  Padding(
           padding:  EdgeInsets.symmetric(horizontal:  25.0),
           child:  CustomTextField(
              hint: 'Title',
              maxLines: 5,
            ),
         ),
          const SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:  25.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                      title: 'Edit',
                      onTap: () {
                        // print('object');
                      }),
                ),
                    SizedBox(width: 20,),
                Expanded(
                  child: CustomButton(
                      title: 'Back',
                      onTap: () {
                        // print('object');
                      }),
                ),
              ],
            ),
          )
      ],
    );
  }
}