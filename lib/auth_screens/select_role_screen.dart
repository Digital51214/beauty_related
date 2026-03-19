import 'package:beauty_related/auth_screens/signup2.dart';
import 'package:beauty_related/custom_widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'Signup1.dart';


class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  int selectedIndex = -1; // 👈 koi bhi select nahi by default
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/selectscreen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.025,
            right: w * 0.025,
            top: h * 0.55,
          ),
          child: Column(
            children: [
              Text(
                'Select Your Role',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: baseSize * 0.08,
                ),
              ),
              Text(
                'Select the path that best reflects your\nbeauty journey',
                textAlign: TextAlign.center, // 👈 ye add karo
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: baseSize * 0.045,
                ),
              ),
              SizedBox(height: h * 0.04),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      height: h * 0.058,
                      width: w * 0.45,
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? Color(0xFF46151A61).withOpacity(0.38)// 👈 selected color
                            : Color(0xFFF3F9F061).withOpacity(0.38),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: selectedIndex == 0
                              ? Colors.white // 👈 selected border
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Beauty Client',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Spacer(),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      height: h * 0.058,
                      width: w * 0.45,
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? Color(0xFF46151A61).withOpacity(0.38)
                            : Color(0xFFF3F9F061).withOpacity(0.38),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: selectedIndex == 1
                              ? Colors.white
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Beauty Professional',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: h * 0.045),
              CustomButton(
                title: 'Continue',
                onPressed: () {
                  if (selectedIndex == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Signup1()),
                    );
                  } else if (selectedIndex == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Signup2()),
                    );
                  } else {
                    // 👇 agar kuch select nahi kiya
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
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
