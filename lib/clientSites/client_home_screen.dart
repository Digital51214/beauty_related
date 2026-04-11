import 'dart:ui';
import 'package:beauty_related/custom_widgets/blackish_glass_effect.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/glass_effect.dart';
import 'notifications_screen.dart' show ClientNotificationScreen;


class ClientHomescreen extends StatefulWidget {
  const ClientHomescreen({super.key});

  @override
  State<ClientHomescreen> createState() => _ClientHomescreenState();
}

class _ClientHomescreenState extends State<ClientHomescreen> {
  final List<Map<String, dynamic>> stats = [
    {
      "icon": Icons.star,
      "iconColor": const Color(0xFFFFB545),
      "title": "Total Reviews",
      "value": "128",
    },
    {
      "icon": Icons.remove_red_eye_outlined,
      "iconColor": Colors.white,
      "title": "Profile Views",
      "value": "1239",
    },
    {
      "icon": Icons.event_available_outlined,
      "iconColor": Colors.white,
      "title": "Bookings",
      "value": "128",
    },
    {
      "icon": Icons.payments_outlined,
      "iconColor": Colors.white,
      "title": "Earnings",
      "value": "\$2k",
    },
  ];

  final List<Map<String, String>> quickActions = [
    {
      "title": "New Review Recieved",
      "subtitle": "Amazing service, highly recommend....",
      "time": "2h Ago..",
    },
    {
      "title": "New Review Recieved",
      "subtitle": "Amazing service, highly recommend....",
      "time": "2h Ago..",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double horizontalPad = size.width * 0.055;
    final double topPad = size.height * 0.03;
    final double avatarSize = size.width * 0.155;
    final double bellSize = size.width * 0.14;
    final double greetingFont = size.width * 0.03;
    final double nameFont = size.width * 0.05;
    final double gridGap = size.width * 0.035;
    final double cardRadius = size.width * 0.07;
    final double actionCardHeight = size.height * 0.098;
    final double sectionTitleFont = size.width * 0.036;

    return Scaffold(
      body: Stack(
        children: [
          const Screensbackground(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPad),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: topPad),

                  /// top row
                  Row(
                    children: [
                      Container(
                        width: avatarSize,
                        height: avatarSize,
                        padding: EdgeInsets.all(size.width * 0.006),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: size.width * 0.004,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/home2.jpg"),
                        ),
                      ),
                      const Spacer(),

                      RepaintBoundary(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const ClientNotificationScreen(),
                              ),
                            );
                          },
                          child: SizedBox(
                            width: bellSize,
                            height: bellSize,
                            child: GlassCard(
                              borderRadius: bellSize / 2,
                              blurSigma: 2,
                              tintOpacity: 0.05,
                              child: Center(
                                child: Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                  size: size.width * 0.065,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size.height * 0.025),

                  Text(
                    "Good Morning!",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.90),
                      fontSize: greetingFont,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "Scarlet Jhonson",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: nameFont,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Serif',
                    ),
                  ),

                  SizedBox(height: size.height * 0.035),

                  /// stats grid
                  GridView.builder(
                    itemCount: stats.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: gridGap,
                      mainAxisSpacing: gridGap,
                      childAspectRatio: 1.25,
                    ),
                    itemBuilder: (context, index) {
                      final item = stats[index];
                      return RepaintBoundary(
                        child: _GlassStatCard(
                          icon: item["icon"],
                          iconColor: item["iconColor"],
                          title: item["title"],
                          value: item["value"],
                          radius: cardRadius,
                        ),
                      );
                    },
                  ),

                  SizedBox(height: size.height * 0.035),

                  Text(
                    "Quick Actions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: sectionTitleFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  SizedBox(height: size.height * 0.02),

                  ...List.generate(
                    quickActions.length,
                        (index) => Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.01),
                      child: RepaintBoundary(
                        child: _QuickActionCard(
                          title: quickActions[index]["title"]!,
                          subtitle: quickActions[index]["subtitle"]!,
                          time: quickActions[index]["time"]!,
                          height: actionCardHeight,
                          radius: cardRadius * 0.75,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassStatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;
  final double radius;

  const _GlassStatCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GlassCard(
      borderRadius: radius,
      blurSigma: 7,
      tintOpacity: 0.05,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.035,
        vertical: size.height * 0.01,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: size.width * 0.075),
          SizedBox(height: size.height * 0.01),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.92),
              fontSize: size.width * 0.026,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.068,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final double height;
  final double radius;

  const _QuickActionCard({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.height,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: height,
      child: GlassCard(
        borderRadius: radius,
        blurSigma: 7,
        tintOpacity: 0.05,
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.014,
        ),
        child: Row(
          children: [
            Container(
              width: size.width * 0.13,
              alignment: Alignment.center,
              child: Icon(
                Icons.star,
                color: const Color(0xFFFFB545),
                size: size.width * 0.075,
              ),
            ),
            SizedBox(width: size.width * 0.02),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Serif',
                    ),
                  ),
                  SizedBox(height: size.height * 0.004),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.92),
                      fontSize: size.width * 0.025,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: size.width * 0.02),
            Text(
              time,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.032,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Screensbackground extends StatelessWidget {
  const Screensbackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(
        "assets/images/bg3.png",
        fit: BoxFit.cover,
      ),
    );
  }
}