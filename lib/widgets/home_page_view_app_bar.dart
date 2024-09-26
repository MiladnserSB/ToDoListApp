import 'package:flutter/material.dart';

class HomePageViewAppBar extends StatelessWidget {
  const HomePageViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Text(
            'To Do List App',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const Spacer(),
          const Text(
            'Hi, user',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundColor: Colors.deepPurple.shade200,
            child: const Icon(
              Icons.person,
            ),
          )
        ],
      ),
    );
  }
}
