import 'package:flutter/material.dart';

class BookingsScreens extends StatefulWidget {
  const BookingsScreens({super.key});

  @override
  State<BookingsScreens> createState() => _BookingsScreensState();
}

class _BookingsScreensState extends State<BookingsScreens> {
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
            top: h * 0.05,
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
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/images/liked1.png'),
                  ),
                ],
              ),
              SizedBox(height: h * 0.015),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Bookings',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: baseSize * 0.055,
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
                  ),
                ),
              ),
              SizedBox(height: h*0.02),
              Row(
                children: [
                  Container(
                    height: h * 0.05,
                    width: w * 0.26,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F9F061).withOpacity(0.38),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Upcoming',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.015),
                  Container(
                    height: h * 0.05,
                    width: w * 0.25,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F9F061).withOpacity(0.38),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Completed',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: w * 0.015),
                  Container(
                    height: h * 0.05,
                    width: w * 0.26,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F9F061).withOpacity(0.38),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Cancelled',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: h*0.04),
              AspectRatio(
                aspectRatio: 17 / 7.1, // image ke hisaab se change karo
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/images/booking1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: h * 0.25,
                          width: w * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage('assets/images/homeicon2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: w * 0.025),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: h * 0.045,
                                  width: w * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/booking2.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Upcoming',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: w * 0.2),
                                Text(
                                  "\$45.00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: h * 0.008),
                            Text(
                              'Helper on Studio',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: h * 0.006),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage('assets/images/liked2.png'),
                                  height: baseSize* 0.05,
                                  width: baseSize * 0.05,
                                ),
                                SizedBox(width: w*0.01),
                                Text(
                                  'Manicure',
                                  style: TextStyle(
                                    fontSize: baseSize*0.03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(width: w*0.05),
                                Image(
                                  image: AssetImage('assets/images/liked3.png'),
                                  height: baseSize* 0.05,
                                  width: baseSize * 0.05,
                                ),
                                SizedBox(width: w*0.02),
                                Text(
                                  '5 Feb, 11:00 AM',
                                  style: TextStyle(
                                    fontSize: baseSize*0.03,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: h * 0.008),
                            Row(
                              children: [
                                Container(
                                  height: h * 0.045,
                                  width: w * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/liked4.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Reschedule',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: w*0.04),
                                Container(
                                  height: h * 0.045,
                                  width: w * 0.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/liked5.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
