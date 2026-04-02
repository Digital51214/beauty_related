import 'package:beauty_related/auth_screens/login.dart';
import 'package:beauty_related/auth_screens/privacy_policy.dart';
import 'package:beauty_related/auth_screens/terms_condition_screen.dart';
import 'package:beauty_related/OwnersSite/bottomnavigation_screen.dart';
import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:beauty_related/custom_widgets/custom_textformfield.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../app_routes.dart';

class SignupClient extends StatefulWidget {
  const SignupClient({super.key});

  @override
  State<SignupClient> createState() => _SignupClientState();
}

class _SignupClientState extends State<SignupClient> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();

  final TapGestureRecognizer _termsTapRecognizer = TapGestureRecognizer();
  final TapGestureRecognizer _privacyTapRecognizer = TapGestureRecognizer();

  bool checked = true;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  double getResponsiveFont(double screenWidth, double size) {
    return (screenWidth / 375) * size;
  }

  @override
  void initState() {
    super.initState();

    _termsTapRecognizer.onTap = () {
      Get.toNamed(AppRoutes.terms);
    };

    _privacyTapRecognizer.onTap = () {
      Get.toNamed(AppRoutes.privacy);
    };
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _termsTapRecognizer.dispose();
    _privacyTapRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF46151A),
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logoForSignIn.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.035,
              vertical: h * 0.03,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: h * 0.9,
              ),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.035,
                        vertical: h * 0.025,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'A',
                              fontSize: getResponsiveFont(w, 31),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: h * 0.005),
                          Text(
                            'Enter Your Account Details',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.95),
                              fontFamily: 'A',
                              fontSize: getResponsiveFont(w, 15),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: h * 0.04),

                          CustomTextformfield(
                            title: 'Username....',
                            controller: _userNameController,
                            KeyBoardType: TextInputType.name,
                          ),
                          SizedBox(height: h * 0.01),

                          CustomTextformfield(
                            title: 'Email Address...',
                            controller: _emailController,
                            KeyBoardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: h * 0.01),

                          CustomTextformfield(
                            title: 'Password...',
                            controller: _passwordController,
                            obscureText: true,
                            KeyBoardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: h * 0.01),

                          CustomTextformfield(
                            title: 'Confirm Password....',
                            controller: _confirmPasswordController,
                            obscureText: true,
                            KeyBoardType: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: h * 0.01),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Transform.scale(
                                scale: 0.95,
                                child: Checkbox(
                                  value: checked,
                                  onChanged: (value) {
                                    setState(() {
                                      checked = value ?? false;
                                    });
                                  },
                                  shape: const CircleBorder(),
                                  side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  fillColor: MaterialStateProperty.resolveWith(
                                        (states) =>
                                    states.contains(MaterialState.selected)
                                        ? const Color(0xFF46151A)
                                        : Colors.transparent,
                                  ),
                                  checkColor: Colors.white,
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: getResponsiveFont(w, 12),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      const TextSpan(text: 'I agree with all '),
                                      TextSpan(
                                        text: 'Terms & Conditions',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                        ),
                                        recognizer: _termsTapRecognizer,
                                      ),
                                      const TextSpan(text: ' and '),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.white,
                                        ),
                                        recognizer: _privacyTapRecognizer,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: h * 0.04),

                          SizedBox(
                            width: double.infinity,
                            child: CustomButton(
                              title: 'Sign Up',
                              onPressed: () {
                                Get.offAllNamed(AppRoutes.bottomNav);
                              },
                            ),
                          ),

                          SizedBox(height: h * 0.08),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account. ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'A',
                                  fontSize: getResponsiveFont(w, 14),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offNamed(AppRoutes.login);
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'A',
                                    fontSize: getResponsiveFont(w, 14),
                                    fontWeight: FontWeight.w700,
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
    );
  }
}