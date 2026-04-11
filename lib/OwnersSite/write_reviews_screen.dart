import 'package:beauty_related/custom_widgets/blackish_glass_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../custom_widgets/glass_effect.dart';

class WriteReviewScreen extends StatefulWidget {
  const WriteReviewScreen({super.key});

  @override
  State<WriteReviewScreen> createState() => _WriteReviewScreenState();
}

class _WriteReviewScreenState extends State<WriteReviewScreen> {
  int selectedStars = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                      child: GlassCard(
                        borderRadius: 100,
                        tintOpacity: 0.15,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: baseSize * 0.06,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Write a Review',
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

              // ── Scrollable Body ──
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.only(
                    left: w * 0.045,
                    right: w * 0.045,
                    bottom:
                    MediaQuery.of(context).viewInsets.bottom + h * 0.02,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.01),

                      // ── Helper Info Card ──
                      GlassCard(
                        borderRadius: 50,
                        tintOpacity: 0.18,
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.02,
                          vertical: h * 0.005,
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: baseSize * 0.20,
                              width: baseSize * 0.30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white.withOpacity(0.3),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/homeicon3.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: w * 0.035),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Helper on Studio',
                                  style: TextStyle(
                                    fontFamily: 'A',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: baseSize * 0.042,
                                  ),
                                ),
                                Text(
                                  'Nails full beauty',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.75),
                                    fontWeight: FontWeight.w400,
                                    fontSize: baseSize * 0.032,
                                  ),
                                ),
                                SizedBox(height: h * 0.005),
                                Text(
                                  'Service Date 12 Oct, 2026',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.65),
                                    fontWeight: FontWeight.w300,
                                    fontSize: baseSize * 0.028,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.025),

                      // ── Review Input Card ──
                      GlassCard1(
                        borderRadius: 30,
                        tintOpacity: 0.12,
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05,
                          vertical: h * 0.025,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'How was Your Experience?',
                              style: TextStyle(
                                fontFamily: 'A',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: baseSize * 0.045,
                              ),
                            ),

                            SizedBox(height: h * 0.022),

                            // ── Stars ──
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedStars = index + 1;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.015),
                                    child: Icon(
                                      Icons.star,
                                      color: index < selectedStars
                                          ? const Color(0xFFD4A843)
                                          : Colors.white.withOpacity(0.5),
                                      size: baseSize * 0.13,
                                    ),
                                  ),
                                );
                              }),
                            ),

                            SizedBox(height: h * 0.025),

                            // ── Text Field ──
                            GlassCard1(
                              borderRadius: 35,
                              tintOpacity: 0.07,
                              child: TextField(
                                controller: _reviewController,
                                maxLines: 5,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: baseSize * 0.04,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Share your experience...',
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.45),
                                    fontSize: baseSize * 0.04,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: w * 0.04,
                                    vertical: h * 0.015,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),

                            SizedBox(height: h * 0.03),

                            // ── Submit Button ──
                            GestureDetector(
                              onTap: () {
                                if (selectedStars == 0) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Please select a star rating'),
                                      backgroundColor: Color(0xFF46151A),
                                    ),
                                  );
                                  return;
                                }
                                Get.back();
                              },
                              child: Container(
                                width: double.infinity,
                                height: h * 0.062,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/buttonBG.png"),
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    'Submit Review',
                                    style: TextStyle(
                                      fontFamily: 'A',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: baseSize * 0.042,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.02),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}