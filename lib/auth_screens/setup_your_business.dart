import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_routes.dart';
import '../custom_widgets/custom_button.dart';

class SetupYourBusinessScreen extends StatefulWidget {
  const SetupYourBusinessScreen({super.key});

  @override
  State<SetupYourBusinessScreen> createState() =>
      _SetupYourBusinessScreenState();
}

class _SetupYourBusinessScreenState extends State<SetupYourBusinessScreen> {
  final TextEditingController _businessNameController =
  TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  String? _selectedCategory;
  String? _selectedBusinessCategory;

  final List<String> _categories = [
    'Beauty',
    'Salon',
    'Spa',
    'Makeup',
  ];

  final List<String> _businessCategories = [
    'Nails',
    'Hair',
    'Makeup Studio',
    'Skincare',
  ];

  @override
  void dispose() {
    _businessNameController.dispose();
    _ownerNameController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    super.dispose();
  }

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

  Widget _buildBorderField({
    required TextEditingController controller,
    required String hintText,
    required double height,
    required double fontSize,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.35),
          width: 1,
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontFamily: 'A',
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.85),
            fontSize: fontSize,
            fontFamily: 'A',
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
          suffixIcon: suffixIcon,
        ),
        cursorColor: Colors.white,
      ),
    );
  }

  Widget _buildDropdownField({
    required String hintText,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required double height,
    required double fontSize,
  }) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.35),
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          dropdownColor: const Color(0xFF6D5555),
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.white,
          ),
          hint: Text(
            hintText,
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: fontSize,
              fontFamily: 'A',
            ),
          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'A',
          ),
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(
                e,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize,
                  fontFamily: 'A',
                ),
              ),
            ),
          )
              .toList(),
          onChanged: onChanged,
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
            image: AssetImage(
              'assets/images/bg_ombre.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                SizedBox(height: h * 0.025),
                Text(
                  'Setup Your Business',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: baseSize * 0.072,
                  ),
                ),
                SizedBox(height: h * 0.006),
                Text(
                  'Craft a presence that reflects your artistry',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white.withOpacity(0.95),
                    fontWeight: FontWeight.w400,
                    fontSize: baseSize * 0.038,
                  ),
                ),
                SizedBox(height: h * 0.03),

                _glassCard(
                  borderRadius: 35,
                  blurSigma: 15,
                  tintOpacity: 0.10,
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.045,
                    vertical: h * 0.03,
                  ),
                  child: Column(
                    children: [
                      _buildBorderField(
                        controller: _businessNameController,
                        hintText: 'Business Name....',
                        height: h * 0.06,
                        fontSize: baseSize * 0.034,
                      ),
                      SizedBox(height: h * 0.015),

                      _buildBorderField(
                        controller: _ownerNameController,
                        hintText: 'Owner Name...',
                        height: h * 0.06,
                        fontSize: baseSize * 0.034,
                      ),
                      SizedBox(height: h * 0.015),

                      _buildDropdownField(
                        hintText: 'Category',
                        value: _selectedCategory,
                        items: _categories,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
                        height: h * 0.06,
                        fontSize: baseSize * 0.034,
                      ),
                      SizedBox(height: h * 0.015),

                      _buildDropdownField(
                        hintText: 'Business category',
                        value: _selectedBusinessCategory,
                        items: _businessCategories,
                        onChanged: (value) {
                          setState(() {
                            _selectedBusinessCategory = value;
                          });
                        },
                        height: h * 0.06,
                        fontSize: baseSize * 0.034,
                      ),
                      SizedBox(height: h * 0.015),

                      _buildBorderField(
                        controller: _locationController,
                        hintText: 'Location...',
                        height: h * 0.06,
                        fontSize: baseSize * 0.034,
                        suffixIcon: const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.015),

                      Container(
                        height: h * 0.1,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.35),
                            width: 1,
                          ),
                        ),
                        child: TextFormField(
                          controller: _bioController,
                          maxLines: 4,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: baseSize * 0.034,
                            fontFamily: 'A',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Short Bio.....',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.85),
                              fontSize: baseSize * 0.034,
                              fontFamily: 'A',
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 14,
                            ),
                          ),
                          cursorColor: Colors.white,
                        ),
                      ),
                      SizedBox(height: h * 0.02),

                      Container(
                        width: double.infinity,
                        height: h * 0.085,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.25),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload_outlined,
                              color: Colors.white,
                              size: baseSize * 0.06,
                            ),
                            SizedBox(height: h * 0.004),
                            Text(
                              'Upload Your Profile Photo',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'A',
                                fontSize: baseSize * 0.033,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      SizedBox(
                        width: double.infinity,
                        child: CustomButton(
                          title: 'Continue',
                          onPressed: () =>
                              Get.toNamed(AppRoutes.addServicesScreen),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }
}