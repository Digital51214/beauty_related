import 'package:beauty_related/auth_screens/select_role_screen.dart';
import 'package:beauty_related/OwnersSite/bottomnavigation_screen.dart';
import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:beauty_related/custom_widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';

import '../app_routes.dart';
import 'forget_password_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool checked = false;

  double getResponsiveFont(double screenWidth, double size) {
    return (screenWidth / 375) * size;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;

    return Scaffold(
      backgroundColor: Color(0xFF46151A),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logoForSignIn.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: w * 0.02,
              right: w * 0.02,
              top: h * 0.18,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: h * 0.63,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.57,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'A',
                            fontSize: getResponsiveFont(w, 30),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: h * 0.008),
                        Text(
                          'Welcome Back! Enter Your Account Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'A',
                            fontSize: getResponsiveFont(w, 15),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: h * 0.025),

                        CustomTextformfield(
                          title: 'Email Address...',
                          controller: _userNameController,
                          KeyBoardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: h * 0.01),

                        CustomTextformfield(
                          title: 'Password....',
                          controller: _passwordController,
                          obscureText: true,
                          KeyBoardType: TextInputType.visiblePassword,
                        ),
                        SizedBox(height: h * 0.015),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: const CircleBorder(),
                              value: checked,
                              onChanged: (value) {
                                setState(() {
                                  checked = value ?? false;
                                });
                              },
                              fillColor: MaterialStateProperty.resolveWith(
                                    (states) => states.contains(MaterialState.selected)
                                    ? const Color(0xFF000000)
                                    : Colors.transparent,
                              ),
                              checkColor: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                "Remember Me",
                                style: TextStyle(
                                  fontFamily: 'A',
                                  fontWeight: FontWeight.w400,
                                  fontSize: getResponsiveFont(w, 14),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.forgetPassword);
                              },
                              child: Text(
                                "Forget Password?",
                                style: TextStyle(
                                  fontFamily: 'A',
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: getResponsiveFont(w, 14),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.03),

                        CustomButton(
                          title: 'Sign In',
                          onPressed: () {
                            Get.offAllNamed(AppRoutes.bottomNav,);
                          },
                        ),

                                                   CustomButton(
                              title: 'Sign In',
                              onPressed: () {
                                Get.offAllNamed(AppRoutes.clientBottomNav,);
                              },
                            ),

                            SizedBox(height: h * 0.03),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Flexible(
                        child: Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'A',
                          fontSize: getResponsiveFont(w, 14),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.selectRole);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'A',
                          fontSize: getResponsiveFont(w, 16),
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                        ),
                      ),
                    ),
                    ],
                  ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    ),
    ),
    ),
    );
  }
}