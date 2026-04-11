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
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                    child: CustomPaint(
                      painter: GlassPainter(),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.06,
                          vertical: h * 0.04,
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
                : Colors.white.withOpacity(0.28),
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
class GlassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const radiusValue = 50.0;
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      const Radius.circular(radiusValue),
    );

    // 1. Base glass
    canvas.drawRRect(
      rrect,
      Paint()..color = Colors.white.withOpacity(0.01),
    );

    // 2. Soft overall shine
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.25),
            Colors.white.withOpacity(0.05),
            Colors.transparent,
          ],
          stops: const [0.0, 0.4, 0.8],
        ).createShader(Offset.zero & size),
    );

    // 3. ✨ 4-SIDE SHINY BORDER (main part)
    final borderPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.2),
          Colors.white.withOpacity(0.5),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(Offset.zero & size)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;

    canvas.drawRRect(rrect, borderPaint);

    // 4. Inner soft light border (optional premium feel)
    final innerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(1.5, 1.5, size.width - 3, size.height - 3),
      const Radius.circular(radiusValue - 2),
    );

    canvas.drawRRect(
      innerRRect,
      Paint()
        ..color = Colors.white.withOpacity(0.01)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.6,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}