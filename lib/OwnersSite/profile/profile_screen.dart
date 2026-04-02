
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../app_routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    // ✅ Responsive breakpoints
    final bool isTablet = baseSize > 600;
    final double avatarRadius = isTablet ? baseSize * 0.09 : baseSize * 0.13;
    final double nameFontSize = isTablet ? baseSize * 0.04 : baseSize * 0.055;
    final double emailFontSize = isTablet ? baseSize * 0.035 : baseSize * 0.045;
    final double tileHeight = isTablet ? h * 0.08 : h * 0.072;
    final double iconSize = isTablet ? h * 0.06 : h * 0.055;
    final double tileFontSize = isTablet ? baseSize * 0.03 : baseSize * 0.038;
    final double topPadding = isTablet ? h * 0.08 : h * 0.1;
    final double horizontalPadding = isTablet ? w * 0.06 : w * 0.025;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // ✅ Prevents overflow on small screens
            padding: EdgeInsets.only(
              left: w*0.035,
              right:w*0.035,
              top: topPadding,
              bottom: h * 0.25,
            ),
            child: Column(
              children: [
                // ---- Avatar ----
                CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage:
                  const AssetImage('assets/images/home2.jpg'),
                ),
                SizedBox(height: h * 0.02),

                // ---- Name ✅ fontFamily: 'A' ----
                Text(
                  'Scarlet Jhonson',
                  style: TextStyle(
                    fontFamily: 'A',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: nameFontSize,
                  ),
                ),

                // ---- Email ✅ NO fontFamily (as requested) ----
                Text(
                  'Scarlet@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: emailFontSize,
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ---- Notifications Tile ----
                _buildNotificationsTile(
                  h: h,
                  w: w,
                  tileHeight: tileHeight,
                  tileFontSize: tileFontSize,
                ),

                SizedBox(height: h * 0.015),

                // ---- Reviews Tile ----
                _buildNavTile(
                  label: 'Reviews',
                  h: h,
                  tileHeight: tileHeight,
                  iconSize: iconSize,
                  tileFontSize: tileFontSize,
                  onTap: () {
                    Get.toNamed(AppRoutes.reviews);
                  },
                ),

                SizedBox(height: h * 0.015),

                // ---- Account Settings Tile ----
                _buildNavTile(
                  label: 'Account Settings',
                  h: h,
                  tileHeight: tileHeight,
                  iconSize: iconSize,
                  tileFontSize: tileFontSize,
                  onTap: () {
                    Get.toNamed(AppRoutes.accountSetting);
                  },
                ),

                SizedBox(height: h * 0.015),

                // ---- Help Center Tile ----
                _buildNavTile(
                  label: 'Help Center',
                  h: h,
                  tileHeight: tileHeight,
                  iconSize: iconSize,
                  tileFontSize: tileFontSize,
                  onTap: () {
                    // TODO: navigate to Help Center
                  },
                ),

                SizedBox(height: h * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ✅ Notifications tile extracted as helper
  Widget _buildNotificationsTile({
    required double h,
    required double w,
    required double tileHeight,
    required double tileFontSize,
  }) {
    return Container(
      height: tileHeight,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('assets/images/profile1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: Row(
          children: [
            Text(
              'Notifications',
              style: TextStyle(
                fontFamily: 'A', // ✅ font family A
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: tileFontSize,
              ),
            ),
            const Spacer(),
            Switch(
              value: isNotificationOn,
              onChanged: (value) {
                setState(() {
                  isNotificationOn = value;
                });
              },
              activeColor: const Color(0xFF46151A),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ Reusable nav tile helper
  Widget _buildNavTile({
    required String label,
    required double h,
    required double tileHeight,
    required double iconSize,
    required double tileFontSize,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: tileHeight,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
            image: AssetImage('assets/images/profile1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: h * 0.025),
          child: Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'A', // ✅ font family A
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: tileFontSize,
                ),
              ),
              const Spacer(),
              Container(
                height: iconSize,
                width: iconSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/profile2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Icon(
                  Icons.north_east_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}