import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:beauty_related/custom_widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'otp_verification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: const Color(0xFF46151A),
      // ✅ keyboard open hone par resize hogi
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
                        Navigator.pop(context);
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
                      'Forget Password',
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
                  height: baseSize * 0.6, // ✅ thoda chota kiya space bachane
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
                                "Enter Email",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'A',
                                ),
                              ),
                              const Text(
                                "Enter Mail To Verify Your Identity",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: h * 0.02),
                              CustomTextformfield(
                                title: 'Email Address...',
                                controller: _emailController,
                                KeyBoardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: h * 0.02),
                              CustomButton(
                                title: 'Send Code',
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const OTPVerification(),
                                    ),
                                  );
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