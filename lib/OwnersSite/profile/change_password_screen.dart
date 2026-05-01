import 'dart:ui';
import 'package:beauty_related/custom_widgets/blackish_glass_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/glass_effect.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});
  @override
  State<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends State<ChangePasswordScreen> {
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.035,
              vertical: h * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: GlassCard(
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
                    CircleAvatar(
                      radius: baseSize * 0.055,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.02),
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: baseSize * 0.062,
                  ),
                ),
                SizedBox(height: h * 0.02),
                Center(
                  child: Image.asset(
                    'assets/images/changepassword.png',
                    height: baseSize * 0.45,
                    width: baseSize * 0.45,
                  ),
                ),
                SizedBox(height: h * 0.03),

                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/MainLogo.png"),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.06,
                          vertical: h * 0.035,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Colors.black.withOpacity(0.1),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.2,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPasswordField(
                              hintText: 'Enter Old Password',
                              obscure: _obscureOld,
                              h: h,
                              w: w,
                              baseSize: baseSize,
                              onToggle: () =>
                                  setState(() => _obscureOld = !_obscureOld),
                            ),
                            SizedBox(height: h * 0.015),
                            _buildPasswordField(
                              hintText: 'Enter New Password',
                              obscure: _obscureNew,
                              h: h,
                              w: w,
                              baseSize: baseSize,
                              onToggle: () =>
                                  setState(() => _obscureNew = !_obscureNew),
                            ),
                            SizedBox(height: h * 0.015),
                            _buildPasswordField(
                              hintText: 'Confirm New Password',
                              obscure: _obscureConfirm,
                              h: h,
                              w: w,
                              baseSize: baseSize,
                              onToggle: () => setState(
                                    () => _obscureConfirm = !_obscureConfirm,
                              ),
                            ),
                            SizedBox(height: h * 0.03),
                            CustomButton(title: 'Update', onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
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

  Widget _buildPasswordField({
    required String hintText,
    required bool obscure,
    required double h,
    required double w,
    required double baseSize,
    required VoidCallback onToggle,
  }) {
    return Container(
      height: h * 0.062,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.white.withOpacity(0.35),
          width: 1,
        ),
      ),
      child: TextFormField(
        obscureText: obscure,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'A',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white70,
            fontFamily: 'A',
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: h * 0.02,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.white70,
              size: baseSize * 0.05,
            ),
          ),
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}