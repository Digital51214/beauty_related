import 'package:flutter/material.dart';

class BookingsScreens extends StatefulWidget {
  const BookingsScreens({super.key});

  @override
  State<BookingsScreens> createState() => _BookingsScreensState();
}

class _BookingsScreensState extends State<BookingsScreens> {

  // ─── Selected Tab ───
  String _selectedTab = 'Upcoming'; // 👈 default selected

  // ─── Tab Button ───
  Widget _tabButton(String title, double h, double w, double baseSize) {
    final bool isSelected = _selectedTab == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: h * 0.05,
        width: w * 0.26,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.transparent                    // ✅ selected = transparent
              : Colors.white.withOpacity(0.2),        // ✅ unselected = white 0.2
          borderRadius: BorderRadius.circular(40),
          border: isSelected
              ? Border.all(color: Colors.white, width: 1.5) // ✅ selected border
              : Border.all(color: Colors.transparent, width: 1.5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'A',
              fontSize: baseSize * 0.035,
            ),
          ),
        ),
      ),
    );
  }

  // ─── Upcoming Content ───
  Widget _upcomingContent(double h, double w, double baseSize) {
    return AspectRatio(
      aspectRatio: 17 / 7.1,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
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
                  image: const DecorationImage(
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
                        height: h * 0.043,
                        width: w * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/booking2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Upcoming',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'A',
                              fontSize: baseSize * 0.032,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: w * 0.2),
                      Text(
                        '\$45.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,

                          fontSize: baseSize * 0.038,
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
                      fontFamily: 'A',
                      fontSize: baseSize * 0.038,
                    ),
                  ),
                  SizedBox(height: h * 0.006),
                  Row(
                    children: [
                      Image(
                        image: const AssetImage('assets/images/liked2.png'),
                        height: baseSize * 0.05,
                        width: baseSize * 0.05,
                      ),
                      SizedBox(width: w * 0.01),
                      Text(
                        'Manicure',
                        style: TextStyle(
                          fontSize: baseSize * 0.03,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,

                        ),
                      ),
                      SizedBox(width: w * 0.05),
                      Image(
                        image: const AssetImage('assets/images/liked3.png'),
                        height: baseSize * 0.05,
                        width: baseSize * 0.05,
                      ),
                      SizedBox(width: w * 0.02),
                      Text(
                        '5 Feb, 11:00 AM',
                        style: TextStyle(
                          fontSize: baseSize * 0.03,
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
                        height: h * 0.04,
                        width: w * 0.28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/liked4.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Reschedule',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'A',
                              fontSize: baseSize * 0.032,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: w * 0.04),
                      Container(
                        height: h * 0.04,
                        width: w * 0.24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/liked5.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'A',
                              fontSize: baseSize * 0.032,
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
    );
  }

  // ─── Completed Content ───
  Widget _completedContent(double h, double w, double baseSize) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.05),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Completed Bookings',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: baseSize * 0.042,
              fontFamily: 'A',
            ),
          ),
          SizedBox(height: h * 0.01),
          Text(
            'You have no completed bookings yet.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w300,
              fontSize: baseSize * 0.035,
              fontFamily: 'A',
            ),
          ),
        ],
      ),
    );
  }

  // ─── Cancelled Content ───
  Widget _cancelledContent(double h, double w, double baseSize) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.05),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cancelled Bookings',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: baseSize * 0.042,
              fontFamily: 'A',
            ),
          ),
          SizedBox(height: h * 0.01),
          Text(
            'You have no cancelled bookings yet.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w300,
              fontSize: baseSize * 0.035,
              fontFamily: 'A',
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
              left: w * 0.035,
              right: w * 0.035,
              top: h * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  'Bookings',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: baseSize * 0.055,
                    fontFamily: 'A',
                  ),
                ),
                Text(
                  'Check Out All your saved Lists',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: baseSize * 0.04,
                    fontFamily: 'A',
                  ),
                ),

                SizedBox(height: h * 0.02),

                // ─── Tab Buttons ───
                Row(
                  children: [
                    _tabButton('Upcoming', h, w, baseSize),
                    SizedBox(width: w * 0.015),
                    _tabButton('Completed', h, w, baseSize),
                    SizedBox(width: w * 0.015),
                    _tabButton('Cancelled', h, w, baseSize),
                  ],
                ),

                SizedBox(height: h * 0.04),

                // ─── Tab Content ───
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _selectedTab == 'Upcoming'
                      ? _upcomingContent(h, w, baseSize)
                      : _selectedTab == 'Completed'
                      ? _completedContent(h, w, baseSize)
                      : _cancelledContent(h, w, baseSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}