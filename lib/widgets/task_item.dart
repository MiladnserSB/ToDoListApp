import 'package:flutter/material.dart';
import 'package:to_do_list_app/views/edit_task_view.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return EditTaskView();
              },
            ),
          );
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
                  // Wrapping the title and subtitle in an Expanded widget
                  Expanded(
                    child: ListTile(
                      title: Text(
                        'Flutter Tips - Flutter Flutter Tips - Flutter Flutter Tips - Flutter Flutter Tips - Flutter Flutter Tips - Flutter',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // subtitle: Padding(
                      //   padding: const EdgeInsets.only(top: 12.0, bottom: 4),
                      //   child: Text(
                      //     'Learn how to create responsive layouts in Flutter.',
                      //     style: TextStyle(
                      //         color: Colors.black.withOpacity(0.5),
                      //         fontSize: 16),
                      //     maxLines: 2,
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                    ),
                  ),
                  // Aligning the delete icon and checkbox vertically
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Add delete functionality
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                      Checkbox(value: true, onChanged: (value) {}),
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
}
