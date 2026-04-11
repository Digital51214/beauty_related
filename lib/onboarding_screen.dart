import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui';
import 'app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  late VideoPlayerController _videoController;

  final List<String> titles = [
    "Discover Trusted\nBeautyExperts",
    "Real Reviews. Real Experiences",
    "Book with\nConfidence",
  ];

  final List<String> subtitles = [
    "Find trusted beauty professionals,\nsalons, and studios around you\nwith ease",
    "Find trusted beauty professionals,\nsalons, and studios around you\nwith ease",
    "Find trusted beauty professionals,\nsalons, and studios around you\nwith ease",
  ];

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.asset('assets/images/vedio.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoController.setLooping(true);
        _videoController.setVolume(0);
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    double responsiveFont(double base) {
      return (width / 375) * base;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// Background Video
          if (_videoController.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            ),

          /// PageView — swipe gesture only, no text here
          PageView.builder(
            controller: _controller,
            itemCount: titles.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return const SizedBox.expand();
            },
          ),

          /// Bottom Sheet with Blur + Black Opacity
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(35),bottomLeft:Radius.circular(35) ,
                  topRight: Radius.circular(35),bottomRight: Radius.circular(35)
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.07,
                      vertical: height * 0.025,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Title
                        Text(
                          titles[currentIndex],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsiveFont(28),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'A',
                          ),
                        ),
                        SizedBox(height: height * 0.012),

                        /// Subtitle
                        Text(
                          subtitles[currentIndex],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: responsiveFont(16),
                          ),
                        ),
                        SizedBox(height: height * 0.035),

                        /// Arrow Button with Circular Progress
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: width * 0.18,
                              height: width * 0.18,
                              child: CircularProgressIndicator(
                                value: (currentIndex + 1) / titles.length,
                                strokeWidth: 2,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (currentIndex == titles.length - 1) {
                                  Get.offAllNamed(AppRoutes.login);
                                } else {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                }
                              },
                              child: Container(
                                width: width * 0.155,
                                height: width * 0.155,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/onbdng4.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: responsiveFont(24),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
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
