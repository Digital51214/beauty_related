import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ClientChangePasswordScreen extends StatefulWidget {
  const ClientChangePasswordScreen({super.key});

  @override
  State<ClientChangePasswordScreen> createState() => _ClientChangePasswordScreenState();
}

class _ClientChangePasswordScreenState extends State<ClientChangePasswordScreen> {
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    // ✅ Responsive breakpoints — same as EditProfile
    final bool isTablet = baseSize > 600;
    final double horizontalPadding = isTablet ? w * 0.05 : w * 0.025;
    final double topPadding = isTablet ? h * 0.045 : h * 0.03;
    final double backBtnSize = isTablet ? baseSize * 0.11 : baseSize * 0.12;
    final double titleFontSize = isTablet ? baseSize * 0.05 : baseSize * 0.06;
    final double fieldHeight = isTablet ? h * 0.065 : h * 0.058;
    final double fieldFontSize = isTablet ? baseSize * 0.035 : baseSize * 0.037;
    final double btnHeight = isTablet ? h * 0.07 : h * 0.062;
    final double imageSize = isTablet ? baseSize * 0.42 : baseSize * 0.48;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
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

                // ---- Top Bar ---- (same as EditProfile)
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
                    CircleAvatar(
                      radius: baseSize * 0.055,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.018),

                // ---- Title ----
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: titleFontSize,
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ---- Center Image ----
                Center(
                  child: Image(
                    image: const AssetImage('assets/images/changepassword.png'),
                    height: imageSize,
                    width: imageSize,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: h * 0.08),

                // ---- Blur Card — same as EditProfile ----
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            left: w * 0.05,
                            right: w * 0.05,
                            top: h * 0.04,
                            bottom: h * 0.04,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.black.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.2,
                            ),
                            // ✅ MainLogo.png — same as EditProfile
                            image: const DecorationImage(
                              image: AssetImage('assets/images/MainLogo.png'),
                              fit: BoxFit.contain,
                              opacity: 0.18,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              SizedBox(height: h * 0.01),

                              // ---- Old Password ----
                              _buildPasswordField(
                                hintText: 'Enter Old Password',
                                obscure: _obscureOld,
                                fieldHeight: fieldHeight,
                                fieldFontSize: fieldFontSize,
                                w: w,
                                baseSize: baseSize,
                                onToggle: () => setState(() => _obscureOld = !_obscureOld),
                              ),

                              SizedBox(height: h * 0.018),

                              // ---- New Password ----
                              _buildPasswordField(
                                hintText: 'Enter New Password',
                                obscure: _obscureNew,
                                fieldHeight: fieldHeight,
                                fieldFontSize: fieldFontSize,
                                w: w,
                                baseSize: baseSize,
                                onToggle: () => setState(() => _obscureNew = !_obscureNew),
                              ),

                              SizedBox(height: h * 0.018),

                              // ---- Confirm New Password ----
                              _buildPasswordField(
                                hintText: 'Confirm New Password',
                                obscure: _obscureConfirm,
                                fieldHeight: fieldHeight,
                                fieldFontSize: fieldFontSize,
                                w: w,
                                baseSize: baseSize,
                                onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
                              ),

                              SizedBox(height: h * 0.025),

                              // ---- Update Button — same as EditProfile ----
                              Container(
                                height: btnHeight,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/buttonBG2.png'),
                                    fit: BoxFit.contain,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Reusable password field — same style as EditProfile fields
  Widget _buildPasswordField({
    required String hintText,
    required bool obscure,
    required double fieldHeight,
    required double fieldFontSize,
    required double w,
    required double baseSize,
    required VoidCallback onToggle,
  }) {
    return Container(
      height: fieldHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white.withOpacity(0.12),
        border: Border.all(
          color: Colors.white.withOpacity(0.55),
          width: 1.1,
        ),
      ),
      child: TextFormField(
        obscureText: obscure,
        style: TextStyle(
          fontFamily: 'A',
          color: Colors.white,
          fontSize: fieldFontSize,
          fontWeight: FontWeight.w700,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'A',
            color: Colors.white,
            fontSize: fieldFontSize,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: w * 0.05,
            vertical: fieldHeight * 0.28,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: onToggle,
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.white.withOpacity(0.7),
              size: baseSize * 0.055,
            ),
          ),
        ),
        cursorColor: Colors.white,
      ),
    );
  }
}