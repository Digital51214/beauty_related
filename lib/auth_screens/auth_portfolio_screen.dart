import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_routes.dart';
import '../custom_widgets/custom_button.dart';

class AuthPortfolioScreen extends StatefulWidget {
  const AuthPortfolioScreen({super.key});

  @override
  State<AuthPortfolioScreen> createState() => _AuthPortfolioScreenState();
}

class _AuthPortfolioScreenState extends State<AuthPortfolioScreen> {
  Widget _glassCard({
    required Widget child,
    double borderRadius = 30,
    EdgeInsetsGeometry? padding,
    double blurSigma = 15,
    double tintOpacity = 0.10,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white.withOpacity(tintOpacity),
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

  Widget _portfolioImage(String imagePath, double height) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
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

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Image_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
              vertical: h * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: _glassCard(
                        borderRadius: 50,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: baseSize * 0.055,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/MainLogo.png',
                      height: baseSize * 0.12,
                      width: baseSize * 0.12,
                    ),
                  ],
                ),
                SizedBox(height: h * 0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Portfolio',
                            style: TextStyle(
                              fontFamily: 'A',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: baseSize * 0.072,
                            ),
                          ),
                          SizedBox(height: h * 0.004),
                          Text(
                            'Add or edit your protfolio',
                            style: TextStyle(
                              fontFamily: 'A',
                              color: Colors.white.withOpacity(0.95),
                              fontWeight: FontWeight.w400,
                              fontSize: baseSize * 0.038,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: w * 0.03),
                    GestureDetector(
                      onTap: () {},
                      child: _glassCard(
                        borderRadius: 50,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: baseSize * 0.07,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.03),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              _portfolioImage(
                                'assets/images/home6.jpg',
                                h * 0.27,
                              ),
                              SizedBox(height: h * 0.02),
                              _portfolioImage(
                                'assets/images/homeicon5.jpg',
                                h * 0.18,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: w * 0.045),
                        Expanded(
                          child: Column(
                            children: [
                              _portfolioImage(
                                'assets/images/homeicon3.png',
                                h * 0.18,
                              ),
                              SizedBox(height: h * 0.02),
                              _portfolioImage(
                                'assets/images/homeicon4.jpg',
                                h * 0.27,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: h * 0.025),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    title: 'Get Started',
                    onPressed: () =>
                        Get.toNamed(AppRoutes.clientBottomNav),
                  ),
                ),
                SizedBox(height: h * 0.01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}