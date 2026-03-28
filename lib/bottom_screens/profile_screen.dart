import 'package:beauty_related/bottom_screens/account_setting.dart';
import 'package:beauty_related/bottom_screens/reviews_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotificationOn = false;

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
            top: h * 0.1,
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage('assets/images/home2.jpg'),
              ),
              SizedBox(height: h * 0.02),
              Text(
                'Scarlet Jhonson',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: baseSize * 0.055,
                ),
              ),

              Text(
                'Scarlet@gmail.com',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: baseSize * 0.055,
                ),
              ),
              SizedBox(height: h * 0.02),
              Container(
                height: h * 0.072,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                  child: Row(
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: isNotificationOn,
                        onChanged: (value) {
                          setState(() {
                            isNotificationOn = value;
                          });
                        },
                        activeColor: Color(0xFF46151A),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: h * 0.015),
              GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewsScreen(),));
              },
                child: Container(
                  height: h * 0.072,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  // ✅ added (fix)
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * 0.025,
                    ), // ✅ balanced padding
                    child: Row(
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: h * 0.055,
                          width: h * 0.055, // ✅ fixed (circle perfect)
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Icon(
                            Icons.north_east_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.015),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountSetting()),
                  );
                },
                child: Container(
                  height: h * 0.072,
                  width: double.infinity,
                  clipBehavior: Clip.hardEdge,
                  // ✅ added (fix)
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: w * 0.025,
                    ), // ✅ balanced padding
                    child: Row(
                      children: [
                        Text(
                          'Account Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        Container(
                          height: h * 0.055,
                          width: h * 0.055, // ✅ fixed (circle perfect)
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/profile2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Icon(
                            Icons.north_east_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: h * 0.015),
              Container(
                height: h * 0.072,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                // ✅ added (fix)
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.025,
                  ), // ✅ balanced padding
                  child: Row(
                    children: [
                      Text(
                        'Help Center',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Spacer(),
                      Container(
                        height: h * 0.055,
                        width: h * 0.055, // ✅ fixed (circle perfect)
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Icon(
                          Icons.north_east_outlined,
                          color: Colors.white,
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
    );
  }
}
