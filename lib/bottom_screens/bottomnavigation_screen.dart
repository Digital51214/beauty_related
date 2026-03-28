import 'dart:ui';
import 'package:beauty_related/bottom_screens/bookings_screens.dart';
import 'package:beauty_related/bottom_screens/home_screen.dart';
import 'package:beauty_related/bottom_screens/liked_screens.dart';
import 'package:beauty_related/bottom_screens/profile_screen.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFF2A0D0D),

      // ✅ Show selected screen directly
      body: screens[selectedIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white.withOpacity(0.08),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),

              // ✅ Horizontal overflow fix
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    navItem(Icons.home_outlined, "Home", 0),
                    const SizedBox(width: 10),
                    navItem(Icons.favorite, "Liked", 1),
                    const SizedBox(width: 10),
                    navItem(Icons.menu_book, "Bookings", 2),
                    const SizedBox(width: 10),
                    navItem(Icons.person_outline, "Profile", 3),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, String title, int index) {
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
            ? const EdgeInsets.symmetric(horizontal: 20, vertical: 12)
            : const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isSelected ? 30 : 50),

          // ✅ Only selected item has background image
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
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            if (isSelected) ...[
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
