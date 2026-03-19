import 'package:beauty_related/auth_screens/login.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'assets/images/onbdng1.png',
    'assets/images/onbdng2.png',
    'assets/images/onbdng3.png',
  ];

  final List<String> titles = [
    "Discover Trusted Beauty\nExperts",
    "Real Reviews. Real Experiences",
    "Book with\nConfidence"
  ];

  final List<String> subtitles = [
    "Find trusted beauty professionals,\nsalons, and studios around you\nwith ease",
    "Find trusted beauty professionals,\nsalons, and studios around you\nwith ease",
    "Find trusted beauty professionals,\nsalons, and studios around you\nwith ease"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// 🔹 PageView with background images
          PageView.builder(
            controller: _controller,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  /// Background Image
                  SizedBox.expand(
                    child: Image.asset(images[index], fit: BoxFit.cover),
                  ),

                  /// 🔹 Title & Subtitle (Added)
                  Positioned(
                    bottom: 150,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          titles[index],
                          textAlign: TextAlign.center, // 👈 ADD THIS
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          subtitles[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          /// 🔹 Bottom Button with Circular Progress
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [

                  /// 🔹 Circular Progress Indicator
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(
                      value: (currentIndex + 1) / images.length,
                      strokeWidth: 2,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),

                  /// 🔹 Button
                  GestureDetector(
                    onTap: () {
                      if (currentIndex == images.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Login(),
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },

                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/onbdng4.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
