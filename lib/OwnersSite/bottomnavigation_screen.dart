import 'dart:ui';


import 'package:beauty_related/OwnersSite/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'booking/bookings_screens.dart';
import 'home/home_screen.dart';
import 'liked_screens.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    LikedScreens(),
    BookingsScreens(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    final baseSize = MediaQuery.of(context).size.shortestSide;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF2A0D0D),
      extendBody: true,
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          // ─── Selected Screen ───
          IndexedStack(
            index: selectedIndex,
            children: screens,
          ),

          // ─── Custom Bottom Nav Bar ───
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: w * 0.07,
                right: w * 0.07,
                top: h * 0.012,
                bottom: MediaQuery.of(context).padding.bottom + h * 0.012,
              ),
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(baseSize * 0.1),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bottomBarBG.png'),
                      fit: BoxFit.fill,
                    ),),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: h * 0.002,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(baseSize * 0.1),
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.1)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          navItem('assets/images/home.png', "Home", 0, baseSize, w, h),
                          navItem('assets/images/favourites.png', "Liked", 1, baseSize, w, h),
                          navItem('assets/images/bookings.png', "Bookings", 2, baseSize, w, h),
                          navItem('assets/images/profile.png', "Profile", 3, baseSize, w, h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem(String imagePath, String title, int index, double baseSize,
      double w, double h) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: isSelected
            ? EdgeInsets.symmetric(
          horizontal: w * 0.07,
          vertical: h * 0.013,
        )
            : EdgeInsets.all(baseSize * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            isSelected ? baseSize * 0.09 : baseSize * 0.1,
          ),
          image: isSelected
              ? const DecorationImage(
            image: AssetImage('assets/images/bottom1.png'),
            fit: BoxFit.cover,
          )
              : null,
          gradient: isSelected
              ? const LinearGradient(
            colors: [Color(0xFF5A1A1A), Color(0xFF3A0F0F)],
          )
              : null,
          color: !isSelected ? Colors.white.withOpacity(0.15) : null,
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: baseSize * 0.025,
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: baseSize * 0.060,
              height: baseSize * 0.060,
              color: Colors.white,
            ),
            if (isSelected) ...[
              SizedBox(width: w * 0.02),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: baseSize * 0.035,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}