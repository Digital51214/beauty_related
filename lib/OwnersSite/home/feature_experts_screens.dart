import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class FeatureExpertsScreens extends StatefulWidget {
  const FeatureExpertsScreens({super.key});

  @override
  State<FeatureExpertsScreens> createState() => _FeatureExpertsScreensState();
}

class _FeatureExpertsScreensState extends State<FeatureExpertsScreens> {
  List<bool> isLiked = [false, false, false, false];
  Widget _productCard(double h, double w, String imagePath, int index) {
    return Container(
      width: w * 0.45,
      padding: EdgeInsets.all(w * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            Color(0xFF5C4A4A).withOpacity(0.7),
            Color(0xFFB8B1A8).withOpacity(0.7),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(
              imagePath,
              height: h * 0.1,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: h * 0.0),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Axis Y',
              style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              'The Mini Glow Set',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: w * 0.028,
              ),
            ),
            trailing: GestureDetector( // ✅ added
              onTap: () {
                setState(() {
                  isLiked[index] = !isLiked[index];
                });
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF46151A).withOpacity(0.3),
                ),
                child: Icon(
                  isLiked[index]
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: isLiked[index] ? Colors.white : Colors.white,
                  size: 18,
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
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.025,
            right: w * 0.025,
            top: h * 0.055,
          ),
          child: Column(
            children: [
              // Top Row: Back button & Avatar
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: baseSize * 0.14,
                      width: baseSize * 0.14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/homeicon.png'),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: w * 0.02),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: baseSize * 0.055,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/liked1.png'),
                  ),
                ],
              ),
              SizedBox(height: h * 0.02),
              Align(alignment: Alignment.centerLeft,
                child: Text(
                    "Featured Experts",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'A',
                  fontWeight: FontWeight.w500,
                  fontSize: baseSize * 0.065
                ),),
              ),
              SizedBox(height: h * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: h * 0.12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w,
                              'assets/images/homeicon4.jpg', 0),
                          _productCard(h, w,
                              'assets/images/homeicon5.jpg', 1),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(
                              h, w, 'assets/images/home6.jpg', 2),
                          _productCard(h, w,
                              'assets/images/homeicon6.jpg', 3),
                        ],
                      ), SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(
                              h, w, 'assets/images/home6.jpg', 2),
                          _productCard(h, w,
                              'assets/images/homeicon6.jpg', 3),
                        ],
                      ), SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(
                              h, w, 'assets/images/home6.jpg', 2),
                          _productCard(h, w,
                              'assets/images/homeicon6.jpg', 3),
                        ],
                      ),
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
