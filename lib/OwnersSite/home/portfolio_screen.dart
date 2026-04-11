import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {

  // ─── Liked State ───
  List<bool> isLiked = List.generate(6, (_) => false);

  // ─── Portfolio Data ───
  final List<Map<String, dynamic>> _portfolioItems = [
    {'image': 'assets/images/homeicon4.jpg', 'tall': true},   // left 1
    {'image': 'assets/images/homeicon5.jpg', 'tall': false},  // right 1
    {'image': 'assets/images/home6.jpg',     'tall': false},  // left 2
    {'image': 'assets/images/homeicon6.jpg', 'tall': true},   // right 2
    {'image': 'assets/images/homeicon4.jpg', 'tall': false},  // left 3
    {'image': 'assets/images/homeicon5.jpg', 'tall': false},  // right 3
  ];

  // ─── Portfolio Card ───
  Widget _portfolioCard(
      double h,
      double w,
      double baseSize,
      String imagePath,
      int index,
      bool tall,
      ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Stack(
        children: [
          // ─── Image ───
          Image.asset(
            imagePath,
            height: tall ? h * 0.32 : h * 0.22,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          // ─── Heart Icon ───
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: () => setState(() => isLiked[index] = !isLiked[index]),
              child: Container(
                padding: EdgeInsets.all(baseSize * 0.02),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.25),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                child: Icon(
                  isLiked[index] ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: baseSize * 0.045,
                ),
              ),
            ),
          ),
        ],
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
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: w * 0.04,
              right: w * 0.04,
              top: h * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // ─── Top Bar ───
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: baseSize * 0.12,
                        width: baseSize * 0.12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/homeicon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                          size: baseSize * 0.05,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: baseSize * 0.12,
                      width: baseSize * 0.12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/homeicon.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: baseSize * 0.055,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.015),

                // ─── Heading + Avatar ───
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Portfolio',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: baseSize * 0.065,
                            fontFamily: 'A',
                          ),
                        ),
                        Text(
                          'Check Out Portfolio!',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.w300,
                            fontSize: baseSize * 0.038,
                            fontFamily: 'A',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: baseSize * 0.07,
                      backgroundImage:
                      const AssetImage('assets/images/home2.jpg'),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.02),

                // ─── Grid ───
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: h * 0.04),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, // ✅ same level
                      children: [

                        // ─── Left Column ───
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _portfolioCard(h, w, baseSize,
                                  _portfolioItems[0]['image'], 0,
                                  _portfolioItems[0]['tall']),
                              SizedBox(height: h * 0.012),
                              _portfolioCard(h, w, baseSize,
                                  _portfolioItems[2]['image'], 2,
                                  _portfolioItems[2]['tall']),
                              SizedBox(height: h * 0.012),
                              _portfolioCard(h, w, baseSize,
                                  _portfolioItems[4]['image'], 4,
                                  _portfolioItems[4]['tall']),
                            ],
                          ),
                        ),

                        SizedBox(width: w * 0.03),

                        // ─── Right Column ───
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ✅ koi offset nahi — same level se shuru
                              _portfolioCard(h, w, baseSize,
                                  _portfolioItems[1]['image'], 1,
                                  _portfolioItems[1]['tall']),
                              SizedBox(height: h * 0.012),
                              _portfolioCard(h, w, baseSize,
                                  _portfolioItems[3]['image'], 3,
                                  _portfolioItems[3]['tall']),
                              SizedBox(height: h * 0.012),
                              _portfolioCard(h, w, baseSize,
                                  _portfolioItems[5]['image'], 5,
                                  _portfolioItems[5]['tall']),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}