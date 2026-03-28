import 'package:flutter/material.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
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
            alignment: Alignment.topLeft, // ✅ background image top se start
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: w * 0.035,
            top: h * 0.055,
            right: w * 0.035,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // CircleAvatar with white border
                  Container(
                    width: w * 0.15,
                    height: w * 0.15, // keep square for circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2), // minor space
                      child: CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/images/home2.jpg'),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: baseSize * 0.15,
                    width: baseSize * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/homeicon.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h * 0.018),
              Text(
                'Good Morning!',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFB6B6B6),
                  height: 1.0, // line height = 1, removes extra spacing
                ),
              ),
              SizedBox(height: h * 0.008),
              Text(
                'Scarlet Jhonson',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: h * 0.158,
                    width: w * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('assets/images/provider1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.015),

                          Icon(Icons.star,color: Colors.orange),
                        SizedBox(height: h * 0.015),
                        Text(
                          'Total Reviews',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(height: h * 0.015),
                        Text(
                          '128',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: h * 0.158,
                    width: w * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('assets/images/provider1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.015),
                        Icon(Icons.visibility,color: Colors.white),
                        SizedBox(height: h * 0.015),
                        Text(
                          'Profile Views',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(height: h * 0.015),
                        Text(
                          '1298',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.02),
              Row(
                children: [
                  Container(
                    height: h * 0.158,
                    width: w * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('assets/images/provider1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.015),
                        Icon(Icons.exit_to_app,color: Colors.white,),
                        SizedBox(height: h * 0.015),
                        Text(
                          'Bookings',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(height: h * 0.015),
                        Text(
                          '128',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: h * 0.158,
                    width: w * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage('assets/images/provider1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: h * 0.015),
                        Image(
                          image: AssetImage('assets/images/stars2.png'),
                          height: baseSize * 0.05,
                          width: baseSize * 0.2,
                        ),
                        SizedBox(height: h * 0.015),
                        Text(
                          'earnings',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        SizedBox(height: h * 0.015),
                        Text(
                          "\$12",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Quick Actions',style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
