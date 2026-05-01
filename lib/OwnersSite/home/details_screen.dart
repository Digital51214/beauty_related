import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../app_routes.dart';

class HelperDetailScreen extends StatefulWidget {
  const HelperDetailScreen({super.key});

  @override
  State<HelperDetailScreen> createState() => _HelperDetailScreenState();
}

class _HelperDetailScreenState extends State<HelperDetailScreen> {
  bool _isFavorite = false;

  Widget _glassCard({
    required Widget child,
    double borderRadius = 30,
    BorderRadius? customBorderRadius,
    EdgeInsetsGeometry? padding,
    double blurSigma = 15,
    double tintOpacity = 0.10,
  }) {
    final effectiveRadius =
        customBorderRadius ?? BorderRadius.circular(borderRadius);

    return ClipRRect(
      borderRadius: effectiveRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: effectiveRadius,
            color: Colors.white.withOpacity(tintOpacity),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.2,
            ),
          ),
          child: child,
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
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/background for details.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0x40180606),
                    Color(0xCC1C0909),
                  ],
                  stops: [0.18, 0.38, 0.68],
                ),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.49,
            minChildSize: 0.49,
            maxChildSize: 0.72,
            builder: (context, scrollController) {
              return _glassCard(
                customBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                blurSigma: 15,
                tintOpacity: 0.10,
                padding: EdgeInsets.only(
                  left: w * 0.04,
                  right: w * 0.04,
                  top: h * 0.02,
                  bottom: h * 0.12,
                ),
                child: SingleChildScrollView(
                  controller: scrollController,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _glassCard(
                        borderRadius: 35,
                        blurSigma: 15,
                        tintOpacity: 0.10,
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: baseSize * 0.28,
                              width: baseSize * 0.22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 1.2,
                                ),
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/homeIcon2.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: w * 0.03),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Helper on Studio',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: baseSize * 0.048,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'A',
                                    ),
                                  ),
                                  SizedBox(height: h * 0.003),
                                  Text(
                                    'Nails full beauty',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: baseSize * 0.029,
                                      fontFamily: 'A',
                                    ),
                                  ),
                                  SizedBox(height: h * 0.014),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: baseSize * 0.038,
                                        backgroundImage: const AssetImage(
                                          'assets/images/home2.jpg',
                                        ),
                                      ),
                                      SizedBox(width: w * 0.02),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Nina',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: baseSize * 0.036,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: 'A',
                                                  ),
                                                ),
                                                Text(
                                                  'Owner',
                                                  style: TextStyle(
                                                    color: Colors.white.withOpacity(0.6),
                                                    fontSize: baseSize * 0.026,
                                                    fontFamily: 'A',
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: w * 0.03),
                                            GestureDetector(
                                              onTap: () {
                                                Get.toNamed(AppRoutes.portfolio);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.03,
                                                  vertical: h * 0.009,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(22),
                                                  color: const Color(0xFF46151A)
                                                      .withOpacity(0.9),
                                                  border: Border.all(
                                                    color:
                                                    Colors.white.withOpacity(0.25),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      'See Portfolio',
                                                      style: TextStyle(
                                                        fontFamily: 'A',
                                                        color: Colors.white,
                                                        fontSize: baseSize * 0.026,
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                    ),
                                                    SizedBox(width: w * 0.01),
                                                    Icon(
                                                      Icons.arrow_forward,
                                                      color: Colors.white,
                                                      size: baseSize * 0.03,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: h * 0.02),
                      Text(
                        'Description',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: baseSize * 0.048,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'A',
                        ),
                      ),
                      SizedBox(height: h * 0.01),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent porttitor mi vel porta tempus. Donec ac nunc ut odio auctor vulputate. Fusce bibendum erat  at lectus interdum, eget cursus tellus egestas. Ut varius nulla fringilla tincidunt rhoncus. Nullam nulla dolor, mollis sit amet nisi non, faucibus pellentesque urna. Aenean volutpat id nunc a mollis. Morbi tincidunt risus in nulla ornare sollicitudin. Donec quis posuere ante, quis rutrum sem. Duis suscipit lobortis ultrices. Maecenas pretium diam turpis. "
                            "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin rutrum quam mollis metus vestibulum, ut imperdiet dui imperdiet. Mauris laoreet enim lacus, vel viverra justo luctus sed.",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: baseSize * 0.031,
                          height: 1.7,
                          fontFamily: 'A',
                        ),
                      ),
                      SizedBox(height: h * 0.03),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.04,
                  vertical: h * 0.01,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: _glassCard(
                        borderRadius: baseSize * 0.065,
                        blurSigma: 15,
                        tintOpacity: 0.10,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: baseSize * 0.055,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: _glassCard(
                        borderRadius: baseSize * 0.065,
                        blurSigma: 15,
                        tintOpacity: 0.10,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _isFavorite
                                ? const Color(0xFFFF4D6D)
                                : Colors.white,
                            size: baseSize * 0.055,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.fromLTRB(
            w * 0.04,
            h * 0.012,
            w * 0.04,
            h * 0.012,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.08),
          ),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.bookAppointment);
            },
            child: Container(
              width: double.infinity,
              height: h * 0.062,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xFF46151A),
                border: Border.all(
                  color: Colors.white.withOpacity(0.15),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: baseSize * 0.042,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'A',
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}