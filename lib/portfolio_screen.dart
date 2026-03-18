import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF46151A), // Dark Red
              Color(0xFFECE4DB), // Orange
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.03,
            right: w * 0.03,
            top: h * 0.07,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: baseSize * 0.14,
                    width: baseSize * 0.14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/privacy.png'),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: w * 0.02),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: baseSize * 0.055,
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.07),
                  Text(
                    'Privacy & Policy',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
