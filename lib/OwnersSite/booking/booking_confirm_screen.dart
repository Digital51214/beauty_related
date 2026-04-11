import 'package:beauty_related/custom_widgets/blackish_glass_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';


class BookingConfirmScreen extends StatelessWidget {
  const BookingConfirmScreen({super.key});

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
          child: Column(
            children: [
              // ── Top Bar ──
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.045,
                  vertical: h * 0.018,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: GlassCard1(
                        borderRadius: 100,
                        tintOpacity: 0.15,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/images/homeicon.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: baseSize * 0.06,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Booking Confirmed',
                      style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: baseSize * 0.057,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/MainLogo.png",
                      height: baseSize * 0.13,
                      width: baseSize * 0.13,
                    ),
                  ],
                ),
              ),

              // ── Scrollable Content ──
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.045),
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.03),

                      // ── Check Circle ──
                      Image.asset("assets/images/check.png",
                          height: baseSize * 0.4, width: baseSize * 0.4),

                      SizedBox(height: h * 0.025),

                      // ── Success Text ──
                      Text(
                        'Your Appointment has been\nsuccessfully scheduled',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: baseSize * 0.045,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),

                      SizedBox(height: h * 0.03),

                      // ── Info Card ──
                      GlassCard1(
                        borderRadius: 32,
                        tintOpacity: 0.15,
                        padding: EdgeInsets.all(w * 0.035),
                        child: Column(
                          children: [
                            // Studio Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: baseSize * 0.28,
                                  width: baseSize * 0.22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.black.withOpacity(0.3),
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.15),
                                      width: 1.5,
                                    ),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          'assets/images/homeicon3.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: w * 0.04),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Helper on Studio',
                                        style: TextStyle(
                                          fontFamily: 'A',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: baseSize * 0.048,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.003),
                                      Text(
                                        'Nails full beauty',
                                        style: TextStyle(
                                          color:
                                          Colors.white.withOpacity(0.7),
                                          fontSize: baseSize * 0.032,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.008),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: baseSize * 0.036,
                                            backgroundImage: const AssetImage(
                                                'assets/images/home2.jpg'),
                                          ),
                                          SizedBox(width: w * 0.02),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nina',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: baseSize * 0.035,
                                                  fontFamily: 'A',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Owner',
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontSize: baseSize * 0.025,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Divider
                            Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: h * 0.015),
                              child: Divider(
                                color: Colors.white.withOpacity(0.25),
                                thickness: 1,
                              ),
                            ),

                            // Service & Date Row
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.content_cut_rounded,
                                        color:
                                        Colors.white.withOpacity(0.85),
                                        size: baseSize * 0.055,
                                      ),
                                      SizedBox(width: w * 0.025),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Service',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.6),
                                              fontSize: baseSize * 0.028,
                                            ),
                                          ),
                                          Text(
                                            'Signature Haircut',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: baseSize * 0.034,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: baseSize * 0.1),

                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.access_time_filled,
                                        color:
                                        Colors.white.withOpacity(0.85),
                                        size: baseSize * 0.055,
                                      ),
                                      SizedBox(width: w * 0.025),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Date',
                                            style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.6),
                                              fontSize: baseSize * 0.028,
                                            ),
                                          ),
                                          Text(
                                            '6 Feb, 2026',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: baseSize * 0.036,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.03),
                    ],
                  ),
                ),
              ),

              // ── View My Bookings Button ──
              Padding(
                padding: EdgeInsets.only(
                  left: w * 0.045,
                  right: w * 0.045,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.writeReview);
                  },
                  child: Container(
                    width: double.infinity,
                    height: h * 0.065,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image:
                        AssetImage('assets/images/buttonBG2.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'View My Bookings',
                        style: TextStyle(
                          fontFamily: 'A',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: baseSize * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: baseSize * 0.25),
            ],
          ),
        ),
      ),
    );
  }
}