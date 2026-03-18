import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType KeyBoardType;

  const CustomTextformfield({
    super.key,
    required this.title,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    required this.KeyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return Center( // 👈 Centered on screen
      child: SizedBox(
        width: 350, // 👈 desired width
        child: TextFormField(
          keyboardType: KeyBoardType,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            hintText: title,
            hintStyle: TextStyle(
              color: Colors.white
            ),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
