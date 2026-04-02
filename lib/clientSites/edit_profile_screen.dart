import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../OwnersSite/image_picker_screen.dart';

class ClientEditProfile extends StatefulWidget {
  const ClientEditProfile({super.key});

  @override
  State<ClientEditProfile> createState() => _ClientEditProfileState();
}

class _ClientEditProfileState extends State<ClientEditProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    final bool isTablet = baseSize > 600;
    final double horizontalPadding = isTablet ? w * 0.05 : w * 0.025;
    final double topPadding = isTablet ? h * 0.045 : h * 0.03;
    final double backBtnSize = isTablet ? baseSize * 0.11 : baseSize * 0.12;
    final double titleFontSize = isTablet ? baseSize * 0.05 : baseSize * 0.06;
    final double fieldHeight = isTablet ? h * 0.065 : h * 0.058;
    final double fieldFontSize = isTablet ? baseSize * 0.035 : baseSize * 0.037;
    final double btnHeight = isTablet ? h * 0.07 : h * 0.062;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: w*0.035,
              right: w*0.035,

              bottom: h * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ---- Top Bar ----
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: baseSize * 0.13,
                        width: baseSize * 0.13,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/images/homeicon.png",
                          ),fit: BoxFit.contain,),
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: baseSize * 0.06,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/MainLogo.png',
                      height: backBtnSize,
                      width: backBtnSize,
                    ),
                  ],
                ),

                SizedBox(height: h * 0.018),

                // ---- Title ----
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ---- Avatar ----
                Center(
                  child: ImagePickerScreen(
                    onPickImage: (pickedImage) {
                      setState(() {});
                    },
                  ),
                ),

                SizedBox(height: h * 0.025),

                // ---- Card ----
                ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.05,
                        vertical: h * 0.03,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.black.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.18),
                          width: 1.2,
                        ),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/MainLogo.png'),
                          fit: BoxFit.contain,
                          opacity: 0.08,
                        ),
                      ),
                      child: Column(
                        children: [

                          // ---- Name Field ----
                          _buildField(
                            hintText: 'Scarlet Jhonson',
                            keyboardType: TextInputType.name,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize,
                            w: w,
                          ),

                          SizedBox(height: h * 0.015),

                          // ---- Email Field ----
                          _buildField(
                            hintText: 'Scarletjhonson@gmail.com',
                            keyboardType: TextInputType.emailAddress,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize,
                            w: w,
                          ),

                          SizedBox(height: h * 0.015),

                          // ---- Phone Field ----
                          _buildField(
                            hintText: '07093753487',
                            keyboardType: TextInputType.phone,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize,
                            w: w,
                          ),

                          SizedBox(height: h * 0.015),

                          // ---- Category Field ----
                          _buildField(
                            hintText: 'Makeup',
                            keyboardType: TextInputType.text,
                            fieldHeight: fieldHeight,
                            fieldFontSize: fieldFontSize,
                            w: w,
                          ),

                          SizedBox(height: h * 0.015),

                          // ---- Description Field (multiline) ----
                          Container(
                            width: double.infinity,
                            height: h * 0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white.withOpacity(0.12),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.35),
                                width: 1.1,
                              ),
                            ),
                            child: TextFormField(
                              maxLines: 4,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: fieldFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: w * 0.05,
                                  vertical: h * 0.015,
                                ),
                                border: InputBorder.none,
                                hintText: 'Description.loremipusm...',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: fieldFontSize,
                                ),
                              ),
                              cursorColor: Colors.white,
                            ),
                          ),

                          SizedBox(height: h * 0.025),

                          // ---- Update Button ----
                          Container(
                            height: btnHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/buttonBG2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  fontFamily: 'A',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: baseSize * 0.042,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---- Reusable Field Widget ----
  Widget _buildField({
    required String hintText,
    required TextInputType keyboardType,
    required double fieldHeight,
    required double fieldFontSize,
    required double w,
  }) {
    return Container(
      height: fieldHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.12),
        border: Border.all(
          color: Colors.white.withOpacity(0.35),
          width: 1.1,
        ),
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        style: TextStyle(
          color: Colors.white,
          fontSize: fieldFontSize,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: fieldHeight * 0.28,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: fieldFontSize,
          ),
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}