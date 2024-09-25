import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/task_item.dart';

class TaskListItems extends StatelessWidget {
  const TaskListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  25.0),
        child: ListView.builder(itemBuilder: (context,index){
          
          return TaskItem();
        }, padding: EdgeInsets.zero,),
      ),
    );
  }
}


