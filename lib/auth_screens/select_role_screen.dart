import 'package:beauty_related/auth_screens/signup2.dart';
import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../app_routes.dart';
import 'Signup1.dart';

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
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/selectscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.10,
              left: w * 0.04,
              right: w * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Align(alignment: Alignment.center,
                child: Text(
                  'Select Your Role',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: baseSize * 0.07,
                    fontFamily: 'A',
                  ),
                ),
              ),
              SizedBox(height: h * 0.02),
              Align( alignment: Alignment.center,
                child: Text(
                  'Select the path that best reflects your\nbeauty journey',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: baseSize * 0.038,
                    fontFamily: 'A',
                  ),
                ),
              ),
              SizedBox(height: h * 0.05),

              Row(
                children: [
                  // Beauty Client button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Container(
                        height: h * 0.055,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? Colors.white.withOpacity(0.25)
                              : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: selectedIndex == 0
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                            width: selectedIndex == 0 ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Beauty Client',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: selectedIndex == 0
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              fontSize: baseSize * 0.038,
                              fontFamily: 'A',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: w * 0.04),

                  // Beauty Professional button
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Container(
                        height: h * 0.055,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1
                              ? Colors.white.withOpacity(0.25)
                              : Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: selectedIndex == 1
                                ? Colors.white
                                : Colors.white.withOpacity(0.5),
                            width: selectedIndex == 1 ? 2 : 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Beauty Professional',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: selectedIndex == 1
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              fontSize: baseSize * 0.038,
                              fontFamily: 'A',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.06),

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
            ],
          ),
        ),
      ),
    );
  }
}