import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF46151A),
      body: Center(
        child: Image(
          image: AssetImage('assets/images/splash.png'),
          width: 300,
          height: 600,// fixed size = no layout shift
          filterQuality: FilterQuality.none, // no smooth animation feel
        ),
      ),
    );
  }
}