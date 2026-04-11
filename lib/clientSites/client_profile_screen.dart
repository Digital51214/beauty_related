import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_routes.dart';
import '../custom_widgets/glass_effect.dart';

class ClientProfileScreen extends StatefulWidget {
  const ClientProfileScreen({super.key});
  @override
  State<ClientProfileScreen> createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    final double avatarSize = w * 0.30;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                horizontal: w * 0.035, vertical: h * 0.02),
            child: Column(
              children: [
                Container(
                  width: avatarSize,
                  height: avatarSize,
                  padding: EdgeInsets.all(w * 0.006),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: w * 0.004),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/home2.jpg'),
                  ),
                ),
                SizedBox(height: h * 0.015),
                Text('Scarlet Jhonson',
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: baseSize * 0.055)),
                Text('Scarlet@gmail.com',
                    style: TextStyle(
                        color: Colors.white70, fontSize: baseSize * 0.038)),
                SizedBox(height: h * 0.025),

                // Notifications tile
                GlassCard(
                  blurSigma: 4,
                  tintOpacity: 0.03,
                  borderRadius: 30,
                  child: SizedBox(
                    height: h * 0.072,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                      child: Row(
                        children: [
                          Text('Notifications',
                              style: TextStyle(
                                  fontFamily: 'A',
                                  color: Colors.white,
                                  fontSize: baseSize * 0.038)),
                          const Spacer(),
                          Switch(
                            value: isNotificationOn,
                            onChanged: (v) =>
                                setState(() => isNotificationOn = v),
                            inactiveTrackColor:
                            Colors.white.withOpacity(0.3),
                            activeColor: const Color(0xFF46151A),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: h * 0.015),
                _buildNavTile(
                    label: 'Account Settings',
                    h: h, w: w, baseSize: baseSize,
                    onTap: () =>
                        Get.toNamed(AppRoutes.clientAccountSetting)),
                SizedBox(height: h * 0.015),
                _buildNavTile(
                    label: 'Help Center',
                    h: h, w: w, baseSize: baseSize,
                    onTap: () {}),
                SizedBox(height: h * 0.04),
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
        blurSigma: 4,
        tintOpacity: 0.03,
        borderRadius: 30,
        child: SizedBox(
          height: h * 0.072,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: h * 0.025),
            child: Row(
              children: [
                Text(label,
                    style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontSize: baseSize * 0.038)),
                const Spacer(),
                Container(
                  height: h * 0.048,
                  width: h * 0.048,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: const Icon(Icons.north_east_outlined,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
