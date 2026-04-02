import 'package:flutter/material.dart';
import 'dart:ui';

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      backgroundColor: const Color(0xFF1C0909),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // ─── Full Background Image ───
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/background for details.png',
                    fit: BoxFit.cover,
                  ),
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
                          Color(0xFF1C0909),
                        ],
                        stops: [0.2, 0.38, 0.65, 0.80],
                      ),
                    ),
                  ),
                ),

                // ─── Scrollable Content ───
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: h * 0.50),

                      // ─── Main Container ───
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              left: w * 0.04,
                              right: w * 0.04,
                              top: w * 0.05,
                              bottom: h * 0.03,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.12),
                                width: 1,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                // ─── Studio Info Row ───
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: Colors.white.withOpacity(0.15),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
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
                                              image: AssetImage('assets/images/homeicon3.png'),
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
                                                children: [
                                                  CircleAvatar(
                                                    radius: baseSize * 0.036,
                                                    backgroundImage: const AssetImage('assets/images/home2.jpg'),
                                                  ),
                                                  SizedBox(width: w * 0.02),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                          color: Colors.white.withOpacity(0.5),
                                                          fontSize: baseSize * 0.024,
                                                          fontFamily: 'A',
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: w * 0.02),


                                                  // ─── See Portfolio button ───
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
                                                        borderRadius: BorderRadius.circular(20),
                                                        image: const DecorationImage(
                                                          image: AssetImage('assets/images/buttonBG2.png'),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        border: Border.all(
                                                          color: Colors.white.withOpacity(0.18),
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
                                                            size: baseSize * 0.028,
                                                          ),
                                                        ],
                                                      ),
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
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent porttitor mi vel porta tempus. Donec ac nunc ut odio auctor vulputate. Fusce bibendum erat at lectus interdum, eget cursus tellus egestas. Ut varius nulla fringilla tincidunt rhoncus. Nullam nulla dolor, mollis sit amet nisi non, faucibus pellentesque urna. Aenean volutpat id nunc a mollis. Morbi tincidunt risus in nulla ornare sollicitudin. Donec quis posuere ante, quis rutrum sem. Duis suscipit lobortis ultrices. Maecenas pretium diam turpis. "
                                      "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin rutrum quam mollis metus vestibulum, ut imperdiet dui imperdiet. Mauris laoreet enim lacus, vel viverra justo luctus sed.",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.65),
                                    fontSize: baseSize * 0.030,
                                    height: 1.78,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
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
                            child: Container(
                              height: baseSize * 0.13,
                              width: baseSize * 0.13,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/homeicon.png",
                                ),fit: BoxFit.contain,),
                                shape: BoxShape.circle,

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: baseSize * 0.06,
                              ),
                            ),
                          ),

                          // ─── Favorite Toggle Button ───
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                            child: Container(
                              height: baseSize * 0.13,
                              width: baseSize * 0.13,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage("assets/images/homeicon.png",
                                ),fit: BoxFit.contain,),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.6),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                _isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.white,
                                size: baseSize * 0.06,
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
          ),

          // ─── Bottom Bar ───
          Container(
            color: const Color(0xFF150606),
            child: SafeArea(
              top: false,
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Color(0x14FFFFFF),
                      width: 1,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.04,
                  vertical: h * 0.013,
                ),
                // ─── Book Now Button with Image Background ───
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
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.14),
                        width: 3,
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
        ],
      ),
    );
  }
}