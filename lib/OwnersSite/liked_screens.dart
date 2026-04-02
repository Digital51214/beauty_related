import 'package:flutter/material.dart';

class LikedScreens extends StatefulWidget {
  const LikedScreens({super.key});

  @override
  State<LikedScreens> createState() => _LikedScreensState();
}

class _LikedScreensState extends State<LikedScreens> {

  // ✅ Sab pehle se selected (true)
  List<bool> isLiked = [true, true, true, true];

  Widget _productCard(double h, double w, double baseSize, String imagePath, int index) {
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
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              'Axis Y',
              style: TextStyle(
                color: Colors.white,
                fontSize: w * 0.04,
                fontWeight: FontWeight.w600,
                fontFamily: 'A', // ✅
              ),
            ),
            subtitle: Text(
              'The Mini Glow Set',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: w * 0.028,
                fontFamily: 'A', // ✅
              ),
            ),
            trailing: GestureDetector(
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
                      ? Icons.favorite       // ✅ filled — selected
                      : Icons.favorite_border,
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: w * 0.025,
              right: w * 0.025,
              top: h * 0.015,
            ),
            child: Column(
              children: [

                // ─── Top Bar ───
                Row(
                  children: [
                    CircleAvatar(
                      radius: baseSize * 0.065,
                      backgroundImage: const AssetImage('assets/images/home2.jpg'),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: baseSize * 0.065,
                      backgroundColor: Colors.transparent,
                      backgroundImage: const AssetImage('assets/images/liked1.png'),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.015),

                // ─── Heading ───
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Liked',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: baseSize * 0.055,
                      fontFamily: 'A', // ✅
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Check Out All your saved Lists',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: baseSize * 0.04,
                      fontFamily: 'A', // ✅
                    ),
                  ),
                ),

                SizedBox(height: h * 0.035),

                // ─── Product Grid ───
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(bottom: h * 0.12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _productCard(h, w, baseSize, 'assets/images/homeicon4.jpg', 0),
                            _productCard(h, w, baseSize, 'assets/images/homeicon5.jpg', 1),
                          ],
                        ),
                        SizedBox(height: h * 0.017),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _productCard(h, w, baseSize, 'assets/images/home6.jpg', 2),
                            _productCard(h, w, baseSize, 'assets/images/homeicon6.jpg', 3),
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
      ),
    );
  }
}