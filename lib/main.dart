import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list_app/views/home_page_view.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('tasks_box');
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
