import 'package:flutter/material.dart';
import 'package:to_do_list_app/views/home_page_view.dart';

void main() {
  runApp(ToDoListApp());
}
class ToDoListApp extends StatelessWidget {
  const ToDoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}
