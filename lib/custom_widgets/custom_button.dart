import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ws = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: ws.height * 0.06, // 👈 responsive height
        width: double.infinity,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/images/buttonBG.png'),
            fit: BoxFit.contain,
          ),

          borderRadius: BorderRadius.circular(ws.width * 0.08), // 👈 responsive radius
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'SB',
              color: Colors.white,
              fontSize: ws.width * 0.045, // 👈 responsive font
            ),
          ),
        ),
      ),
    );
  }
}
