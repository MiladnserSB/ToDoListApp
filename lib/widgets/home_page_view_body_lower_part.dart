import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/blocs/tasks/bloc/tasks_bloc.dart';
import 'package:to_do_list_app/widgets/task_item.dart';
import 'package:to_do_list_app/widgets/task_list_item.dart';

class HomePageViewBodyLowerPart extends StatefulWidget {
  const HomePageViewBodyLowerPart({
    super.key,
  });

  @override
  State<HomePageViewBodyLowerPart> createState() => _HomePageViewBodyLowerPartState();
}

class _HomePageViewBodyLowerPartState extends State<HomePageViewBodyLowerPart> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TasksBloc>(context).add(FetchTasks());
  }
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

