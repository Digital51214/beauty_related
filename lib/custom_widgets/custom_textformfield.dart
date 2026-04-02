import 'package:flutter/material.dart';

class CustomTextformfield extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType KeyBoardType;

  const CustomTextformfield({
    super.key,
    required this.title,
    required this.controller,
    this.obscureText = false,
    required this.KeyBoardType,
  });

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: 55,
        width: width * 0.9,
        child: TextFormField(
          keyboardType: widget.KeyBoardType,
          obscureText: _isObscure,
          controller: widget.controller,
          style: const TextStyle(
            color: Colors.white,

          ),
          decoration: InputDecoration(
            hintText: widget.title,
            hintStyle: const TextStyle(
              color: Colors.white70,

            ),
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                _isObscure
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}