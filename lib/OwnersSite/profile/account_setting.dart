

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../app_routes.dart';



class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    final bool isTablet = baseSize > 600;
    final double horizontalPadding = isTablet ? w * 0.05 : w * 0.025;
    final double topPadding = isTablet ? h * 0.045 : h * 0.055;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        // ✅ background image removed — same as design (gradient background via helper1.png)
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: w*0.035,
              right: w*0.035,

            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---- Top Bar ----
                Row(
                  children: [
                    // ✅ Back button — white semi-transparent circle
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
                    // ✅ Top right logo
                    CircleAvatar(
                      radius: baseSize * 0.055,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.02),

                // ---- Title ----
                Text(
                  'Account Settings',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: baseSize * 0.065,
                  ),
                ),

                SizedBox(height: h * 0.035),

                // ---- Edit Profile Tile ----
                _buildNavTile(
                  label: 'Edit Profile',
                  h: h,
                  w: w,
                  baseSize: baseSize,
                  onTap: () {
                    Get.toNamed(AppRoutes.editProfile);
                  },
                ),

                SizedBox(height: h * 0.018),

                // ---- Change Password Tile ----
                _buildNavTile(
                  label: 'Change Password',
                  h: h,
                  w: w,
                  baseSize: baseSize,
                  onTap: () {
                    Get.toNamed(AppRoutes.changePassword);
                  },
                ),

                SizedBox(height: h * 0.018),

                // ---- Delete Account Tile ----
                _buildNavTile(
                  label: 'Delete Account',
                  h: h,
                  w: w,
                  baseSize: baseSize,
                  onTap: () {
                    // TODO: Delete account logic
                  },
                ),

                SizedBox(height: h * 0.03),

                // ---- Logout Button ----
                GestureDetector(
                  onTap: () {
                    _showLogoutDialog(context);
                  },
                  child: Container(
                    height: h * 0.058,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // ✅ white semi-transparent fill + white border — same as image
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.7),
                        width: 1.2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: const AssetImage('assets/images/account2.png'),
                          height: h * 0.03,
                          color: Colors.white,
                        ),
                        SizedBox(width: w * 0.02),
                        Text(
                          'Logout',
                          style: TextStyle(

                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: baseSize * 0.04,
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
      ),
    );
  }

  // ✅ Beautiful Logout Dialog
  void _showLogoutDialog(BuildContext context) {
    final baseSize = MediaQuery.of(context).size.shortestSide;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.55),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: w * 0.08),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.06,
            vertical: h * 0.035,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xFF7B2D35), Color(0xFF3D1318)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.25),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 30,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ---- Logout Icon ----
              Container(
                height: baseSize * 0.18,
                width: baseSize * 0.18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.2,
                  ),
                ),
                child: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                  size: baseSize * 0.09,
                ),
              ),

              SizedBox(height: h * 0.022),

              // ---- Title ----
              Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'A',
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: baseSize * 0.058,
                ),
              ),

              SizedBox(height: h * 0.01),

              // ---- Subtitle ----
              Text(
                'Are you sure you want to\nlogout from your account?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'A',
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w300,
                  fontSize: baseSize * 0.035,
                  height: 1.5,
                ),
              ),

              SizedBox(height: h * 0.032),

              // ---- Buttons Row ----
              Row(
                children: [
                  // Cancel
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: h * 0.058,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.15),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.4),
                            width: 1.0,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontFamily: 'A',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: baseSize * 0.038,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: w * 0.03),

                  // Yes, Logout
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Get.back(); // close dialog

                        // ✅ Success SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 2),
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(
                              horizontal: w * 0.06,
                              vertical: h * 0.04,
                            ),
                            content: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: w * 0.05,
                                vertical: h * 0.018,
                              ),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF7B2D35), Color(0xFF3D1318)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1.0,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: h * 0.045,
                                    width: h * 0.045,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.2),
                                    ),
                                    child: const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  SizedBox(width: w * 0.03),
                                  Text(
                                    'You are logged out\nsuccessfully!',
                                    style: TextStyle(
                                      fontFamily: 'A',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: baseSize * 0.035,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );

                        // ✅ Navigate to Login after 2 seconds
                        await Future.delayed(const Duration(seconds: 2));
                        if (context.mounted) {
                          Get.offAllNamed(AppRoutes.login);
                        }
                      },
                      child: Container(
                        height: h * 0.058,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'Yes, Logout',
                            style: TextStyle(
                              fontFamily: 'A',
                              color: const Color(0xFF692226),
                              fontWeight: FontWeight.w700,
                              fontSize: baseSize * 0.038,
                            ),
                          ),
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
    );
  }

  // ✅ Reusable tile — white semi-transparent, no background image
  Widget _buildNavTile({
    required String label,
    required double h,
    required double w,
    required double baseSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.072,
        width: double.infinity,
        decoration: BoxDecoration(
          // ✅ white fill with opacity — exactly like image
          color: Colors.white.withOpacity(0.18),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'A',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: baseSize * 0.038,
                ),
              ),
              const Spacer(),
              // ✅ Arrow circle button — white semi-transparent
              Container(
                height: h * 0.048,
                width: h * 0.048,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.25),
                ),
                child: Icon(
                  Icons.north_east_outlined,
                  color: Colors.white,
                  size: baseSize * 0.045,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}