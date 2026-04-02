import 'package:flutter/material.dart';

class Customcontainer extends StatelessWidget {
  final String title;
  final double width;
  final bool isSelected;      // 👈 add karo
  final VoidCallback onTap;   // 👈 add karo

  const Customcontainer({
    super.key,
    required this.title,
    required this.width,
    this.isSelected = false,   // 👈 default false
    required this.onTap,       // 👈 required
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: h * 0.05,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isSelected
              ? Colors.white.withOpacity(0.9)   // 👈 selected
              : Colors.white.withOpacity(0.38), // 👈 unselected
          border: isSelected
              ? Border.all(color: Colors.white, width: 1.5)
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white, // 👈 text color
              fontWeight: FontWeight.w600,
              fontFamily: 'A',
            ),
          ),
        ),
      ),
    );
  }
}