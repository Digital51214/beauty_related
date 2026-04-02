import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../app_routes.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  bool _obsecurePassword = true;
  bool _obsecurenewPassword = true;
  bool _obsecureconfirmnewPassword = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: const Color(0xFF46151A),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          left: w * 0.03,
          right: w * 0.03,
          top: h * 0.055,
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
                        image: AssetImage('assets/images/helper2.png'),
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
                  'Change Password',
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
              "assets/images/changepassword.png",
              height: baseSize * 0.6,
              width: baseSize * 0.6,
            ),

            SizedBox(height: h * 0.02),

            // ─── Stack Container with blur background ───
            SizedBox(
              height: baseSize * 0.85,
              width: baseSize * 0.95,
              child: Stack(
                children: [
                  // Background blurred image
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Image.asset(
                          'assets/images/MainLogo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),

                  // Dark overlay
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.35),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),

                  // Border
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  // ─── Content ───
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.02),
                        const Text(
                          "Change Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'A',
                          ),
                        ),
                        const Text(
                          "Enter New Password",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: h * 0.02),

                        // New Password
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            obscureText: _obsecurenewPassword,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Enter New Password',
                              hintStyle: const TextStyle(color: Colors.white70),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obsecurenewPassword = !_obsecurenewPassword;
                                  });
                                },
                                icon: Icon(
                                  _obsecurenewPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                  size: baseSize * 0.055,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.015),

                        // Confirm New Password
                        SizedBox(
                          height: 55,
                          child: TextFormField(
                            obscureText: _obsecureconfirmnewPassword,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Confirm New Password....',
                              hintStyle: const TextStyle(color: Colors.white70),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obsecureconfirmnewPassword =
                                    !_obsecureconfirmnewPassword;
                                  });
                                },
                                icon: Icon(
                                  _obsecureconfirmnewPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.white,
                                  size: baseSize * 0.055,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    color: Colors.white, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: h * 0.025),

                        // ✅ CustomButton replace kiya
                        CustomButton(
                          title: 'Update',
                          onPressed: () {Get.offAllNamed(AppRoutes.login);
                            // Yahan apna update logic lagayein
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}