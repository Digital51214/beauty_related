import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customcontainer extends StatelessWidget {
  final String title;
  final double width; // 👈 required width

  const Customcontainer({
    super.key,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;

    return Container(
      height: h * 0.05,
      width: width, // 👈 direct use
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.38)
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
