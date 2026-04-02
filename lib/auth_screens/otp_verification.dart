import 'package:beauty_related/auth_screens/update_password.dart';
import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../app_routes.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final List<TextEditingController> _otpControllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes =
  List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _otpControllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: const Color(0xFF46151A),
      // ✅ keyboard open hone par resize hoga
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          // ✅ scroll enable — overflow fix
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(
              left: w * 0.03,
              right: w * 0.03,
              top: h * 0.04,
              bottom: h * 0.02,
            ),
            child: Column(
              children: [
                // ─── Top Bar ───
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: baseSize * 0.14,
                        width: baseSize * 0.14,
                        decoration: const BoxDecoration(
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
                    ),
                    SizedBox(width: w * 0.07),
                    const Text(
                      'Verification',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/MainLogo.png",
                      height: baseSize * 0.15,
                      width: baseSize * 0.15,
                    ),
                  ],
                ),

                SizedBox(height: h * 0.01),

                // ─── Center Image ───
                Image.asset(
                  "assets/images/ForgetPassword.png",
                  height: baseSize * 0.6,  // ✅ thoda chota kiya
                  width: baseSize * 0.6,
                ),

                SizedBox(height: h * 0.02),

                // ─── Container with blur background image ───
                Container(
                  width: baseSize * 0.95,
                  // ✅ fixed height nahi — content ke mutabiq khud resize ho
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        // Background image with blur
                        Positioned.fill(
                          child: ImageFiltered(
                            imageFilter:
                            ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                            child: Image.asset(
                              'assets/images/MainLogo.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        // Dark overlay
                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.35),
                          ),
                        ),

                        // ─── Content ───
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04,
                            vertical: h * 0.025,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Enter Code",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'A',
                                ),
                              ),
                              const Text(
                                "Enter Code To Verify",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: h * 0.025),

                              // ─── 6 OTP Boxes ───
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: List.generate(6, (index) {
                                  return SizedBox(
                                    height: baseSize * 0.12,
                                    width: baseSize * 0.12,
                                    child: TextFormField(
                                      controller: _otpControllers[index],
                                      focusNode: _focusNodes[index],
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      maxLength: 1,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: baseSize * 0.055,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                      decoration: InputDecoration(
                                        counterText: '',
                                        contentPadding: EdgeInsets.zero,
                                        // ✅ white with opacity 0.2 fill color
                                        filled: true,
                                        fillColor:
                                        Colors.white.withOpacity(0.2),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 1,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          borderSide: const BorderSide(
                                            color: Colors.white,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                      onChanged: (value) =>
                                          _onChanged(value, index),
                                    ),
                                  );
                                }),
                              ),

                              SizedBox(height: h * 0.025),

                              CustomButton(
                                title: 'Verify',
                                onPressed: () {
                                  Get.toNamed(AppRoutes.updatePassword);
                                },
                              ),

                              SizedBox(height: h * 0.01),
                            ],
                          ),
                        ),
                      ],
                    ),
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