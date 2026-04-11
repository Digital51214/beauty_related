import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import '../../app_routes.dart';
import '../custom_widgets/glass_effect.dart';

class ClientAccountSetting extends StatefulWidget {
  const ClientAccountSetting({super.key});
  @override
  State<ClientAccountSetting> createState() => _ClientAccountSettingState();
}

class _ClientAccountSettingState extends State<ClientAccountSetting> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: Colors.transparent,
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.035),
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
                          child: Icon(Icons.arrow_back_ios_new,
                              color: Colors.white, size: baseSize * 0.055),
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
                SizedBox(height: h * 0.025),
                Text('Account Settings',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: baseSize * 0.065)),
                SizedBox(height: h * 0.03),

                _buildNavTile(label: 'Edit Profile', h: h, w: w, baseSize: baseSize,
                    onTap: () => Get.toNamed(AppRoutes.clientEditProfile)),
                SizedBox(height: h * 0.018),
                _buildNavTile(label: 'Change Password', h: h, w: w, baseSize: baseSize,
                    onTap: () => Get.toNamed(AppRoutes.clientChangePassword)),
                SizedBox(height: h * 0.018),
                _buildNavTile(label: 'Delete Account', h: h, w: w, baseSize: baseSize,
                    onTap: () {}),
                SizedBox(height: h * 0.03),

                // Logout button
                GestureDetector(
                  onTap: () => _showLogoutDialog(context),
                  child: GlassCard(
                    borderRadius: 30,
                    child: SizedBox(
                      height: h * 0.062,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.logout_rounded,
                              color: Colors.white, size: baseSize * 0.05),
                          SizedBox(width: w * 0.02),
                          Text('Logout',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: baseSize * 0.04)),
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

  Widget _buildNavTile({
    required String label,
    required double h,
    required double w,
    required double baseSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
        borderRadius: 30,
        child: SizedBox(
          height: h * 0.072,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Row(
              children: [
                Text(label,
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: baseSize * 0.038)),
                const Spacer(),
                Container(
                  height: h * 0.045,
                  width: h * 0.045,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Icon(Icons.north_east_outlined,
                      color: Colors.white, size: baseSize * 0.04),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final baseSize = MediaQuery.of(context).size.shortestSide;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.55),
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(horizontal: w * 0.08),
        child: GlassCard(
          borderRadius: 28,
          blurSigma: 20,
          padding: EdgeInsets.symmetric(
              horizontal: w * 0.06, vertical: h * 0.035),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GlassCard(
                borderRadius: 50,
                child: SizedBox(
                  height: baseSize * 0.17,
                  width: baseSize * 0.17,
                  child: Icon(Icons.logout_rounded,
                      color: Colors.white, size: baseSize * 0.085),
                ),
              ),
              SizedBox(height: h * 0.02),
              Text('Logout',
                  style: TextStyle(
                      fontFamily: 'A',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: baseSize * 0.055)),
              SizedBox(height: h * 0.01),
              Text('Are you sure you want to\nlogout from your account?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'A',
                      color: Colors.white70,
                      fontSize: baseSize * 0.033,
                      height: 1.5)),
              SizedBox(height: h * 0.03),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: GlassCard(
                        borderRadius: 30,
                        child: SizedBox(
                          height: h * 0.058,
                          child: Center(
                            child: Text('Cancel',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'A',
                                    fontSize: baseSize * 0.037)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.03),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        Get.back();
                        await Future.delayed(const Duration(seconds: 1));
                        if (context.mounted) Get.offAllNamed(AppRoutes.login);
                      },
                      child: Container(
                        height: h * 0.058,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text('Yes, Logout',
                              style: TextStyle(
                                  fontFamily: 'A',
                                  color: const Color(0xFF692226),
                                  fontWeight: FontWeight.w700,
                                  fontSize: baseSize * 0.036)),
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
}