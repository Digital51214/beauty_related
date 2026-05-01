import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_routes.dart';
import '../custom_widgets/custom_button.dart';

class YourServicesScreen extends StatefulWidget {
  const YourServicesScreen({super.key});

  @override
  State<YourServicesScreen> createState() => _YourServicesScreenState();
}

class _YourServicesScreenState extends State<YourServicesScreen> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: const Color(0xFF46151A),
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
                            'Your Services',
                            style: TextStyle(
                              fontFamily: 'A',
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: baseSize * 0.072,
                            ),
                          ),
                          SizedBox(height: h * 0.004),
                          Text(
                            'Add or edit your services',
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

                _glassCard(
                  borderRadius: 35,
                  blurSigma: 15,
                  tintOpacity: 0.10,
                  padding: EdgeInsets.all(w * 0.03),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: baseSize * 0.25,
                        width: baseSize * 0.19,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/homeicon3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: w * 0.03),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nails full beauty',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.75),
                                fontSize: baseSize * 0.028,
                                fontFamily: 'A',
                              ),
                            ),
                            SizedBox(height: h * 0.004),
                            Text(
                              'Signature\nSculping Facial',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: baseSize * 0.048,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'A',
                                height: 1.1,
                              ),
                            ),
                            SizedBox(height: h * 0.015),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time_filled,
                                  color: Colors.white.withOpacity(0.75),
                                  size: baseSize * 0.026,
                                ),
                                SizedBox(width: w * 0.01),
                                Text(
                                  '60 Min',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontSize: baseSize * 0.027,
                                    fontFamily: 'A',
                                  ),
                                ),
                                SizedBox(width: w * 0.06),
                                Text(
                                  '\$180',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: baseSize * 0.03,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'A',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: h * 0.005),
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                          size: baseSize * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    title: 'Continue',
                    onPressed: () =>
                        Get.toNamed(AppRoutes.addPortfolioScreen),
                  ),
                ),

                SizedBox(height: h * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}