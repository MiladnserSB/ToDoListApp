import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list_app/blocs/tasks/bloc/tasks_bloc.dart';
import 'package:to_do_list_app/models/task_model.dart';
import 'package:to_do_list_app/views/edit_task_view.dart';
import 'package:to_do_list_app/widgets/custom_button.dart'; // Assuming CustomButton is in widgets

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(_createRoute());
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text(
                        task.title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          _showDeleteConfirmationDialog(context);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                      Checkbox(
                        value: task.isDone,
                        onChanged: (value) {
                          task.isDone = !task.isDone;
                          task.save();
                          BlocProvider.of<TasksBloc>(context).add(FetchTasks());
                        },
                      ),
                      Text(task.isDone ? 'Checked' : 'Pending',style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create the custom transition route
  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, animation, secondaryAnimation) =>
          EditTaskView(task: task),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }

  // Function to show a confirmation dialog when deleting a task
  // Function to show a confirmation dialog when deleting a task
  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Task'),
          content: const Text('Are you sure you want to delete this task?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100, // Set the desired width
                  height: 40, // Set the desired height
                  child: CustomButton(
                    title: 'Cancel',
                    onTap: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ),
                SizedBox(
                  width: 100, // Set the desired width
                  height: 40, // Set the desired height
                  child: CustomButton(
                    title: 'Delete',
                    onTap: () {
                      // Delete the task and refresh the list
                      task.delete();
                      BlocProvider.of<TasksBloc>(context).add(FetchTasks());
                      Navigator.of(context)
                          .pop(); // Close the dialog after deleting
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
