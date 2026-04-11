import 'dart:ui';
import 'package:flutter/material.dart';

class Customcontainer extends StatelessWidget {
  final String title;
  final double width;
  final bool isSelected;
  final VoidCallback onTap;

  const Customcontainer({
    super.key,
    required this.title,
    required this.width,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final baseSize = MediaQuery.of(context).size.shortestSide;
    final h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: width,
            height: h * 0.042,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // ─── Selected: slightly more visible; Unselected: same onboarding tint ───
              color: isSelected
                  ? Colors.white.withOpacity(0.5)
                  : Colors.white.withOpacity(0.1),
              border: Border.all(
                color: Colors.white.withOpacity(isSelected ? 0.7 : 0.3),
                width: isSelected ? 1.5 : 1.2,
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'A',
                  color: Colors.white,
                  fontWeight:
                  isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: baseSize * 0.033,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}