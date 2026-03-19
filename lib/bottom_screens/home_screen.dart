import 'package:beauty_related/custom_widgets/customcontainer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _promoCard(double h, double w, double baseSize, String imagePath) {
    return SizedBox(
      width: w * 0.85,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Stack(
          children: [
            Container(
              height: h * 0.2,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: w * 0.06,
                right: w * 0.06,
                top: h * 0.027,
                bottom: h * 0.03,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF5C4A4A).withOpacity(0.95),
                    Color(0xFFB8B1A8).withOpacity(0.5),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Velvet Hair and\nBeauty Lounge',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: baseSize * 0.05,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: h * 0.008),
                  Text(
                    'Lock in Hydration all day with\nthese light weight moisturisers',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: baseSize * 0.03,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: h * 0.01),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * 0.03, // 🔽 width kam
                      vertical: h * 0.011, // 🔼 height zyada
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFF46151A61),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'See Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: baseSize * 0.035,
                          ),
                        ),
                        SizedBox(width: w * 0.02),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: baseSize * 0.055,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -h * 0.03,
              right: -w * 0.03,
              child: Container(
                height: h * 0.16,
                width: h * 0.16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _productCard(double h, double w, String imagePath) {
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
              maxLines: 1,                 // 🔥 important
              overflow: TextOverflow.ellipsis, // agar space kam ho to ...
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: w * 0.028,
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF46151A61).withOpacity(0.2),
              ),
              child: Icon(Icons.favorite_border, color: Colors.white, size: 18),
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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.03,
            top: h * 0.015,
            right: w * 0.03,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/home2.jpg'),
                  ),
                  Spacer(),
                  Container(
                    height: h * 0.15,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/homeicon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image(
                        image: AssetImage('assets/images/homeicon1.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.015),
                  Container(
                    height: h * 0.15,
                    width: w * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/homeicon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Good Morning!',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFB6B6B6),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Scarlet Jhonson',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: h * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Customcontainer(title: 'Make Up', width: w * 0.25),
                    SizedBox(width: w * 0.01),
                    Customcontainer(title: 'Wig', width: w * 0.17),
                    SizedBox(width: w * 0.01),
                    Customcontainer(title: 'Nails', width: w * 0.20),
                    SizedBox(width: w * 0.01),
                    Customcontainer(title: 'Hairs', width: w * 0.20),
                    SizedBox(width: w * 0.01),
                    Customcontainer(title: 'Face Wash', width: w * 0.23),
                    SizedBox(width: w * 0.01),
                    Customcontainer(title: 'Make Up', width: w * 0.25),
                  ],
                ),
              ),
              SizedBox(height: h * 0.03),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _promoCard(h, w, baseSize, 'assets/images/homeicon3.png'),
                    SizedBox(width: w * 0.03),
                    _promoCard(h, w, baseSize, 'assets/images/homeicon2.jpg'),
                    SizedBox(width: w * 0.03),
                    _promoCard(h, w, baseSize, 'assets/images/homeicon3.png'),
                  ],
                ),
              ),
              SizedBox(height: h * 0.015),
              Row(
                children: [
                  Text(
                    'Featured Experts',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.015),

              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: h * 0.12),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/homeicon4.jpg'),
                          _productCard(h, w, 'assets/images/homeicon5.jpg'),
                        ],
                      ),
                      SizedBox(height: h * 0.017),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _productCard(h, w, 'assets/images/home6.jpg'),
                          _productCard(h, w, 'assets/images/homeicon6.jpg'),
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
