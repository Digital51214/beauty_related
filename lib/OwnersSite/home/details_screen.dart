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
    double blurSigma = 12,
    Color? tintColor,
    double tintOpacity = 0.08,
  }) {
    final effectiveRadius =
        customBorderRadius ?? BorderRadius.circular(borderRadius);

    return ClipRRect(
      borderRadius: effectiveRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: CustomPaint(
          painter: _GlassPainter(
            borderRadius: effectiveRadius,
            tintColor: tintColor,
            tintOpacity: tintOpacity,
          ),
          child: padding != null
              ? Padding(padding: padding, child: child)
              : child,
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
        fit: StackFit.expand,
        children: [
          // ─── Full Background Image ───
          Image.asset(
            'assets/images/background for details.png',
            fit: BoxFit.cover,
          ),

          // ─── Dark gradient overlay ───
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0x47180606),
                    Color(0xCC1C0909),
                  ],
                  stops: [0.2, 0.38, 0.65],
                ),
              ),
            ),
          ),

          // ─── Bottom Sheet Content ───
          Positioned(
            top: h * 0.45,
            left: 0,
            right: 0,
            bottom: 0,
            child: _glassCard(
              customBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              borderRadius: 40,
              blurSigma: 5,
              tintOpacity: 0.09,
              padding: EdgeInsets.only(
                left: w * 0.04,
                right: w * 0.04,
                top: w * 0.05,
                bottom: h * 0.12, // bottom button ke liye space
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ─── Studio Info Row ───
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.15),
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ─── Thumbnail ───
                        Container(
                          height: baseSize * 0.28,
                          width: baseSize * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.15),
                              width: 1.5,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/homeicon3.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(width: w * 0.035),

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
                                  color: Colors.white.withOpacity(0.55),
                                  fontSize: baseSize * 0.028,
                                  fontFamily: 'A',
                                ),
                              ),
                              SizedBox(height: h * 0.012),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: baseSize * 0.036,
                                    backgroundImage: const AssetImage(
                                      'assets/images/home2.jpg',
                                    ),
                                  ),
                                  SizedBox(width: w * 0.02),

                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nina',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: baseSize * 0.032,
                                                fontWeight: FontWeight.w600,
                                                fontFamily: 'A',
                                              ),
                                            ),
                                            Text(
                                              'Owner',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                                fontSize: baseSize * 0.024,
                                                fontFamily: 'A',
                                              ),
                                            ),
                                          ],
                                        ),

                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.portfolio);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.025,
                                              vertical: h * 0.007,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/buttonBG2.png",
                                                ),
                                                fit: BoxFit.cover,
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
                                                  size: baseSize * 0.028,
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

                  SizedBox(height: h * 0.015),

                  // ─── Description Title ───
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: baseSize * 0.048,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'A',
                    ),
                  ),
                  SizedBox(height: h * 0.008),

                  // ─── Description Text ───
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent porttitor mi vel porta tempus. Donec ac nunc ut odio auctor vulputate. Fusce bibendum erat at lectus interdum, eget cursus tellus egestas. Ut varius nulla fringilla tincidunt rhoncus. Nullam nulla dolor, mollis sit amet nisi non, faucibus pellentesque urna. Aenean volutpat id nunc a mollis. Morbi tincidunt risus in nulla ornare sollicitudin. Donec quis posuere ante, quis rutrum sem. Duis suscipit lobortis ultrices. Maecenas pretium diam turpis. "
                            "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin rutrum quam mollis metus vestibulum, ut imperdiet dui imperdiet. Mauris laoreet enim lacus, vel viverra justo luctus sed.",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.65),
                          fontSize: baseSize * 0.030,
                          height: 1.78,
                          fontFamily: 'A',
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ─── Top Buttons ───
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
                    // ─── Back Button ───
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: _glassCard(
                        borderRadius: baseSize * 0.065,
                        blurSigma: 5,
                        tintOpacity: 0.13,
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

                    // ─── Favorite Button ───
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                        });
                      },
                      child: _glassCard(
                        borderRadius: baseSize * 0.065,
                        blurSigma: 12,
                        tintOpacity: 0.13,
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

      // ─── Proper Bottom Bar ───
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.0,
            right: w * 0.0,
            bottom: h * 0.0
          ),
          child: ClipRRect(

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(

                padding: EdgeInsets.all(w * 0.015),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.12),

                  border: Border.all(
                    color: Colors.white.withOpacity(0.08),
                    width: 1,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.bookAppointment);
                  },
                  child: Container(
                    width: double.infinity,
                    height: h * 0.058,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/buttonBG2.png'),
                        fit: BoxFit.contain,
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
          ),
        ),
      ),
    );
  }
}

// ─── GlassPainter — local to this file ───
class _GlassPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final Color? tintColor;
  final double tintOpacity;

  const _GlassPainter({
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.tintColor,
    this.tintOpacity = 0.08,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final rrect = borderRadius.toRRect(rect);

    // 1. Base tint
    canvas.drawRRect(
      rrect,
      Paint()..color = (tintColor ?? Colors.white).withOpacity(tintOpacity),
    );

    // 2. Soft diagonal shine
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.22),
            Colors.white.withOpacity(0.06),
            Colors.transparent,
          ],
          stops: const [0.0, 0.35, 0.75],
        ).createShader(rect),
    );

    // 3. Top highlight streak
    final topStreak = RRect.fromRectAndCorners(
      Rect.fromLTWH(size.width * 0.15, 0, size.width * 0.70, 1.2),
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: Radius.zero,
      bottomRight: Radius.zero,
    );

    canvas.drawRRect(
      topStreak,
      Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.55),
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, 1.2)),
    );

    // 4. 4-side shimmer border
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.55),
            Colors.white.withOpacity(0.18),
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.45),
          ],
          stops: const [0.0, 0.35, 0.65, 1.0],
        ).createShader(rect)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.1,
    );

    // 5. Inner glow border
    final innerRect = Rect.fromLTWH(
      1.2,
      1.2,
      size.width - 2.4,
      size.height - 2.4,
    );

    final innerRRect = borderRadius.toRRect(innerRect);

    canvas.drawRRect(
      innerRRect,
      Paint()
        ..color = Colors.white.withOpacity(0.10)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );
  }

  @override
  bool shouldRepaint(covariant _GlassPainter old) {
    return old.borderRadius != borderRadius ||
        old.tintColor != tintColor ||
        old.tintOpacity != tintOpacity;
  }
}