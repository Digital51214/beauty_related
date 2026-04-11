import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../custom_widgets/glass_effect.dart';

class ClientNotificationScreen extends StatefulWidget {
  const ClientNotificationScreen({super.key});
  @override
  State<ClientNotificationScreen> createState() =>
      _ClientNotificationScreenState();
}

class _ClientNotificationScreenState
    extends State<ClientNotificationScreen> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'Special Offer',
      'message':
      'Someone just shared their experience at\nSarah\'s Glow Studio',
      'time': '2 h Ago',
      'image': 'assets/images/review2.png',
    },
    {
      'title': 'Appointment confirmed',
      'message':
      'Someone just shared their experience at\nSarah\'s Glow Studio',
      'time': '2 h Ago',
      'image': 'assets/images/home2.jpg',
    },
    {
      'title': 'Discover',
      'message':
      'Someone just shared their experience at\nSarah\'s Glow Studio',
      'time': '2 h Ago',
      'image': 'assets/images/review2.png',
    },
  ];

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
            padding: EdgeInsets.symmetric(
                horizontal: w * 0.04, vertical: h * 0.015),
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
                              color: Colors.white,
                              size: baseSize * 0.055),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text('Notifications',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: baseSize * 0.052,
                            fontFamily: 'A')),
                    const Spacer(),
                    CircleAvatar(
                      radius: baseSize * 0.055,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.025),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: _notifications.length,
                    separatorBuilder: (_, __) => SizedBox(height: h * 0.015),
                    itemBuilder: (context, index) {
                      final n = _notifications[index];
                      return GlassCard(
                        borderRadius: 22,
                        blurSigma: 15,
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04, vertical: h * 0.016),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: baseSize * 0.065,
                              backgroundImage: AssetImage(n['image']),
                            ),
                            SizedBox(width: w * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(n['title'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: baseSize * 0.042,
                                              fontFamily: 'A')),
                                      const Spacer(),
                                      Text(n['time'],
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: baseSize * 0.03)),
                                    ],
                                  ),
                                  SizedBox(height: h * 0.005),
                                  Text(n['message'],
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: baseSize * 0.031,
                                          height: 1.4)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
