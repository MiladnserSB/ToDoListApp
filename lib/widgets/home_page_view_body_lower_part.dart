import 'package:flutter/material.dart';
import 'package:to_do_list_app/widgets/task_item.dart';
import 'package:to_do_list_app/widgets/task_list_item.dart';

class HomePageViewBodyLowerPart extends StatelessWidget {
  const HomePageViewBodyLowerPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
   child: Column(
     children: [
      SizedBox(height: MediaQuery.of(context).size.height*0.35,),
      const TaskListItems(),
     ],
   ),
    );
  }
}

