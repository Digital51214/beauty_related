import 'dart:ui';

import 'package:beauty_related/custom_widgets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _categories = [
    {'title': 'Make Up', 'width': 0.25},
    {'title': 'Wig', 'width': 0.17},
    {'title': 'Nails', 'width': 0.20},
    {'title': 'Hairs', 'width': 0.20},
    {'title': 'Face Wash', 'width': 0.23},
    {'title': 'Skin Care', 'width': 0.25},
  ];

  List<bool> isLiked = [false, false, false, false];
  final Set<String> _selectedCategories = {};

  void _toggleCategory(String title) {
    setState(() {
      if (_selectedCategories.contains(title)) {
        _selectedCategories.remove(title);
      } else {
        _selectedCategories.add(title);
      }
    });
  }

  Widget _promoCard(double h, double w, double baseSize, String imagePath) {
    return RepaintBoundary(
      child: SizedBox(
        width: w * 0.85,
        child: _glassBox(
          borderRadius: BorderRadius.circular(50),
          blur: 15,
          child: Stack(
            children: [
              Container(
                height: h * 0.2,
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: w * 0.06,
                  right: w * 0.06,
                  top: h * 0.027,
                  bottom: h * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Velvet Hair and\nBeauty Lounge',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: baseSize * 0.05,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'A',
                        height: 1,
                      ),
                    ),
                    SizedBox(height: h * 0.008),
                    Text(
                      'Lock in Hydration all day with\nthese light weight moisturisers',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: baseSize * 0.03,
                        fontFamily: 'A',
                        height: 1,
                      ),
                    ),
                    SizedBox(height: h * 0.01),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.helperDetail);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03,
                          vertical: h * 0.011,
                        ),
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage('assets/images/seeDetailsBG.png'),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'See Details',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'A',
                                fontSize: baseSize * 0.035,
                              ),
                            ),
                            SizedBox(width: w * 0.02),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: baseSize * 0.055,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -h * 0.03,
                right: -w * 0.03,
                child: Container(
                  height: h * 0.16,
                  width: h * 0.16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productCard(
      double h,
      double w,
      double baseSize,
      String imagePath,
      int index,
      ) {
    return RepaintBoundary(
      child: _glassBox(
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
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: w * 0.03,
                  top: h * 0.015,
                  right: w * 0.03,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: baseSize * 0.065,
                      backgroundImage:
                      const AssetImage('assets/images/home2.jpg'),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.search),
                      child: Container(
                        height: baseSize * 0.13,
                        width: baseSize * 0.13,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/homeicon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(baseSize * 0.03),
                          child: Image.asset('assets/images/homeicon1.png'),
                        ),
                      ),
                    ),
                    SizedBox(width: w * 0.015),
                    GestureDetector(
                      onTap: () => Get.toNamed(AppRoutes.notification),
                      child: Container(
                        height: baseSize * 0.13,
                        width: baseSize * 0.13,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/homeicon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                          size: baseSize * 0.065,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: h * 0.008),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.03),
                        child: Text(
                          'Good Morning!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'A',
                            fontSize: baseSize * 0.035,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: w * 0.03),
                        child: Text(
                          'Scarlet Jhonson',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'A',
                            fontWeight: FontWeight.w500,
                            fontSize: baseSize * 0.045,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: h * 0.02),
              Padding(
                padding: EdgeInsets.only(left: w * 0.03),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _categories.map((cat) {
                      final title = cat['title'] as String;
                      return Padding(
                        padding: EdgeInsets.only(right: w * 0.01),
                        child: Customcontainer(
                          title: title,
                          width: w * (cat['width'] as double),
                          isSelected: _selectedCategories.contains(title),
                          onTap: () => _toggleCategory(title),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: h * 0.03),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: w * 0.03, bottom: h * 0.12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RepaintBoundary(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            children: [
                              _promoCard(
                                h,
                                w,
                                baseSize,
                                'assets/images/homeicon3.png',
                              ),
                              SizedBox(width: w * 0.03),
                              RepaintBoundary(
                                child: SizedBox(
                                  width: w * 0.85,
                                  child: _glassBox(
                                    borderRadius: BorderRadius.circular(50),
                                    child: SizedBox(
                                      height: h * 0.2,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: Image.asset(
                                          "assets/images/maps.PNG",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: w * 0.03),
                              _promoCard(
                                h,
                                w,
                                baseSize,
                                'assets/images/homeicon2.jpg',
                              ),
                              SizedBox(width: w * 0.03),
                              _promoCard(
                                h,
                                w,
                                baseSize,
                                'assets/images/homeicon3.png',
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.015),
                      Padding(
                        padding: EdgeInsets.only(right: w * 0.03),
                        child: Row(
                          children: [
                            Text(
                              'Featured Experts',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'A',
                                fontWeight: FontWeight.w500,
                                fontSize: baseSize * 0.045,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed(AppRoutes.featureExperts),
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'A',
                                  fontWeight: FontWeight.w500,
                                  fontSize: baseSize * 0.038,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.015),
                      Padding(
                        padding: EdgeInsets.only(right: w * 0.03),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _productCard(
                                  h,
                                  w,
                                  baseSize,
                                  'assets/images/homeicon4.jpg',
                                  0,
                                ),
                                _productCard(
                                  h,
                                  w,
                                  baseSize,
                                  'assets/images/homeicon5.jpg',
                                  1,
                                ),
                              ],
                            ),
                            SizedBox(height: h * 0.017),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _productCard(
                                  h,
                                  w,
                                  baseSize,
                                  'assets/images/home6.jpg',
                                  2,
                                ),
                                _productCard(
                                  h,
                                  w,
                                  baseSize,
                                  'assets/images/homeicon6.jpg',
                                  3,
                                ),
                              ],
                            ),
                          ],
                        ),
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

Widget _glassBox({
  required Widget child,
  required BorderRadius borderRadius,
  EdgeInsetsGeometry? padding,
  double? height,
  double? width,
  double blur = 15,
  double opacity = 0.1,
}) {
  return RepaintBoundary(
    child: ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          height: height,
          width: width,
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white.withOpacity(opacity),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.2,
            ),
          ),
          child: child,
        ),
      ),
    ),
  );
}