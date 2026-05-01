import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import '../app_routes.dart';
import '../custom_widgets/custom_button.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/selectscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.07,
                        vertical: h * 0.025,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white.withOpacity(0.3)),
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(28),
                          topRight: Radius.circular(28),
                          bottomLeft: Radius.circular(28),
                          bottomRight: Radius.circular(28),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Select Your Role',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: baseSize * 0.07,
                              fontFamily: 'A',
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          Text(
                            'Select the path that best reflects your beauty journey',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: baseSize * 0.038,
                              fontFamily: 'A',
                            ),
                          ),
                          SizedBox(height: h * 0.035),
                          Row(
                            children: [
                              Expanded(
                                child: _roleButton(
                                  'Beauty Client',
                                  0,
                                  h,
                                  w,
                                  baseSize,
                                ),
                              ),
                              SizedBox(width: w * 0.04),
                              Expanded(
                                child: _roleButton(
                                  'Beauty Professional',
                                  1,
                                  h,
                                  w,
                                  baseSize,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.04),
                          CustomButton(
                            title: 'Continue',
                            onPressed: () {
                              if (selectedIndex == 0) {
                                Get.toNamed(AppRoutes.signupClient);
                              } else if (selectedIndex == 1) {
                                Get.toNamed(AppRoutes.signupOwner);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a role first'),
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(height: h * 0.01),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _roleButton(
      String label,
      int index,
      double h,
      double w,
      double baseSize,
      ) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: h * 0.058,
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF46151A).withOpacity(0.6)
              : Colors.white.withOpacity(0.12),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected
                ? Colors.white.withOpacity(0.95)
                : Colors.white.withOpacity(0.00),
            width: 1.0,
          ),
        ),
        child: Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              fontSize: baseSize * 0.036,
              fontFamily: 'A',
            ),
          ),
        ),
      ),
    );
  }
}