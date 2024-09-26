import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/custom_app_bar_image.png'),fit: BoxFit.cover,)
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(title, textAlign: TextAlign.end , style: const TextStyle(
          color: Colors.white,
          fontSize: 26
        ),),
      ),
    );
  }
}