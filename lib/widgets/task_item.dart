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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Flutter Tips - How to Build Responsive UIs in Flutter Flutter Flutter Flutter Flutter Flutter Flutter',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  maxLines: 5, 
                  overflow: TextOverflow.ellipsis, 
                ),
                // subtitle: Padding(
                //   padding: const EdgeInsets.only(top: 12.0, bottom: 4),
                //   child: Text(
                //     'Learn how to create responsive layouts in Flutter.',
                //     style: TextStyle(
                //         color: Colors.black.withOpacity(0.5), fontSize: 16),
                //   ),
                // ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete, size: 25, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'Created in 2023-10-01',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
