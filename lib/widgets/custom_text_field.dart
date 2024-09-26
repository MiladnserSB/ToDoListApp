import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLines = 1});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        filled: true,
      fillColor: Colors.grey.shade300.withOpacity(0.7),  
        contentPadding: EdgeInsets.all(16),
        hintText: hint,
        hintStyle: TextStyle(color: kPrimaryColor),
        enabledBorder: buildBorder(Colors.grey.shade400),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
