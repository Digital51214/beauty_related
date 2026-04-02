import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ClientNotificationScreen extends StatefulWidget {
  const ClientNotificationScreen({super.key});

  @override
  State<ClientNotificationScreen> createState() => _ClientNotificationScreenState();
}

class _ClientNotificationScreenState extends State<ClientNotificationScreen> {

  // ─── Notification Data ───
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Special Offer',
      'message': 'Someone just shared their experience at\nSarah\'s Glow Studio',
      'time': '2 h Ago',
      'image': 'assets/images/review2.png',
    },
    {
      'title': 'Appointment confirmed',
      'message': 'Someone just shared their experience at\nSarah\'s Glow Studio',
      'time': '2 h Ago',
      'image': 'assets/images/home2.jpg',
    },
    {
      'title': 'Discover',
      'message': 'Someone just shared their experience at\nSarah\'s Glow Studio',
      'time': '2 h Ago',
      'image': 'assets/images/review2.png',
    },
  ];

  // ─── Notification Card ───
  Widget _notificationCard(
      double h,
      double w,
      double baseSize,
      String image,
      String title,
      String message,
      String time,
      ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // ✅ blur
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.04,
            vertical: h * 0.015,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12), // ✅ glassmorphism
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.25),
              width: 0.8,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ─── Avatar ───
              CircleAvatar(
                radius: baseSize * 0.065,
                backgroundImage: AssetImage(image),
              ),

              SizedBox(width: w * 0.03),

              // ─── Content ───
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: baseSize * 0.045,
                            fontFamily: 'A',
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontWeight: FontWeight.w500,
                            fontSize: baseSize * 0.03,
                            fontFamily: 'A',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: h * 0.006),

                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                        fontWeight: FontWeight.w300,
                        fontSize: baseSize * 0.033,
                        fontFamily: 'A',
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
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
            padding: EdgeInsets.only(
              left: w * 0.04,
              right: w * 0.04,
              top: h * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ─── Top Bar ───
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
                    Text(
                      'Notifications',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: baseSize * 0.055,
                        fontFamily: 'A',
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: baseSize * 0.06,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.03),

                // ─── Notification Cards ───
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: _notifications.map((notif) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: h * 0.015),
                          child: _notificationCard(
                            h,
                            w,
                            baseSize,
                            notif['image'],
                            notif['title'],
                            notif['message'],
                            notif['time'],
                          ),
                        );
                      }).toList(),
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
}