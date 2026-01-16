import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CustomTextField({super.key , required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (val)=>"please fill the field first.",
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: "TenorSans",
          color: Colors.grey.shade700,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey)
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black)
        )
      ),
    );
  }
}
