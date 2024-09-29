
import 'package:flutter/material.dart';
import 'package:to_do_list_app/constants.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({super.key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged});
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
 final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true){
          return 'Field is required';
        }
      },
      maxLines: maxLines,
      onChanged: onChanged,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade300.withOpacity(0.7),
        contentPadding: EdgeInsets.all(16),
        hintText: hint,
        hintStyle: TextStyle(color: kPrimaryColor),
        enabledBorder: buildBorder(Colors.grey.shade500),
        border: buildBorder(kPrimaryColor),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white, width: 1.5));
  }
}
