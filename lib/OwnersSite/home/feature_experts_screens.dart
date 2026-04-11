import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class FeatureExpertsScreens extends StatefulWidget {
  const FeatureExpertsScreens({super.key});

  @override
  State<FeatureExpertsScreens> createState() => _FeatureExpertsScreensState();
}

class _FeatureExpertsScreensState extends State<FeatureExpertsScreens> {
  List<bool> isLiked = [false, false, false, false,false, false, false, false];

  // ─── Glass Helper — Onboarding Style ───
  Widget _glassBox({
    required Widget child,
    required BorderRadius borderRadius,
    EdgeInsetsGeometry? padding,
    double? height,
    double? width,
    double blur = 15,
    double opacity = 0.1,
  }) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.2,
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  // ─── Product Card ───
  Widget _productCard(double h, double w, String imagePath, int index) {
    final baseSize = MediaQuery.of(context).size.shortestSide;
    return _glassBox(
      borderRadius: BorderRadius.circular(25),
      blur: 15,
      width: w * 0.45,
      padding: EdgeInsets.all(w * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              height: h * 0.1,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Axis Y',
              style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.04,
                fontWeight: FontWeight.w600,
                fontFamily: 'A',
              ),
            ),
            subtitle: Text(
              'The Mini Glow Set',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: w * 0.028,
                fontFamily: 'A',
              ),
            ),
            trailing: GestureDetector(
              onTap: () => setState(() => isLiked[index] = !isLiked[index]),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF46151A).withOpacity(0.3),
                ),
                child: Icon(
                  isLiked[index] ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: baseSize * 0.045,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.025,
            right: w * 0.025,
            top: h * 0.055,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      height: baseSize * 0.14,
                      width: baseSize * 0.14,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/homeicon.png'),
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
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/liked1.png'),
                  ),
                ],
              ),
              SizedBox(height: h * 0.02),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Featured Experts",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'A',
                    fontWeight: FontWeight.w500,
                    fontSize: baseSize * 0.065,
                  ),
                ),
              ),
              SizedBox(height: h * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: h * 0.12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/homeicon4.jpg', 0),
                          _productCard(h, w, 'assets/images/homeicon5.jpg', 1),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/home6.jpg', 2),
                          _productCard(h, w, 'assets/images/homeicon6.jpg', 3),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/home6.jpg', 6),
                          _productCard(h, w, 'assets/images/homeicon6.jpg', 7),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/home6.jpg', 2),
                          _productCard(h, w, 'assets/images/homeicon6.jpg', 3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}