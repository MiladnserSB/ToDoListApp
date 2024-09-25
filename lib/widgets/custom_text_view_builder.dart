import 'package:flutter/material.dart';

class CustomTextViewBuilder extends StatefulWidget {
  const CustomTextViewBuilder({super.key});

  @override
  State<CustomTextViewBuilder> createState() => _CustomTextViewBuilderState();
}

class _CustomTextViewBuilderState extends State<CustomTextViewBuilder> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> texts = [
    "Welcome to the To-Do List App!",
    "Stay organized and productive.",
    "Manage your tasks efficiently.",
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: texts.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Center(
                  child: Text(
                    texts[index],
                    style: TextStyle(fontSize: 24, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          );
  }
}