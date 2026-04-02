import 'package:flutter/material.dart';
import '../custom_widgets/custom_calender_client_side.dart';

class ClientBookingsScreens extends StatefulWidget {
  const ClientBookingsScreens({super.key});

  @override
  State<ClientBookingsScreens> createState() => _ClientBookingsScreensState();
}

class _ClientBookingsScreensState extends State<ClientBookingsScreens> {
  String _selectedTab = 'Upcoming';
  DateTime? _rescheduledDate;
  String? _rescheduledSlot;

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
              ? Colors.transparent
              : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(40),
          border: isSelected
              ? Border.all(color: Colors.white, width: 1.5)
              : Border.all(color: Colors.transparent, width: 1.5),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'A',
              fontSize: baseSize * 0.033,
            ),
          ),
        ),
      ),
    );
  }

  // ─── Month short name ───
  String _monthShort(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  // ─── Open Calendar as Bottom Sheet ───
  void _openRescheduleCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.1),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.78,   // ← 74% height
          minChildSize: 0.78,       // ← minimum bhi 74% fixed
          maxChildSize: 0.78,       // ← maximum bhi 74% fixed (sheet resize nahi hogi)
          expand: false,
          builder: (_, scrollController) {
            return ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
              child: CustomCalendarClientPicker(
                initialDate: _rescheduledDate ?? DateTime.now(),
                onDateConfirmed: (date, slot) {
                  setState(() {
                    _rescheduledDate = date;
                    _rescheduledSlot = slot;
                  });
                  Navigator.pop(ctx);
                },
              ),
            );
          },
        );
      },
    );
  }

  // ─── Upcoming Tab Content ───
  Widget _upcomingContent(double h, double w, double baseSize) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: const DecorationImage(
          image: AssetImage('assets/images/booking1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(baseSize * 0.04),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Provider Image ───
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/homeicon2.jpg',
                height: h * 0.085,
                width: w * 0.18,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: w * 0.025),

            // ─── Booking Info ───
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status + Price row
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: h * 0.038,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/booking2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.025),
                              child: Text(
                                'Upcoming',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'A',
                                  fontSize: baseSize * 0.03,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '\$45.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: baseSize * 0.036,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.007),

                  // Title
                  Text(
                    'Helper on Studio',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'A',
                      fontSize: baseSize * 0.036,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(height: h * 0.005),

                  // Service + Date row
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/liked2.png',
                        height: baseSize * 0.045,
                        width: baseSize * 0.045,
                      ),
                      SizedBox(width: w * 0.01),
                      Flexible(
                        child: Text(
                          'Manicure',
                          style: TextStyle(
                            fontSize: baseSize * 0.028,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: w * 0.02),
                      Image.asset(
                        'assets/images/liked3.png',
                        height: baseSize * 0.045,
                        width: baseSize * 0.045,
                      ),
                      SizedBox(width: w * 0.01),
                      Flexible(
                        child: Text(
                          _rescheduledDate != null && _rescheduledSlot != null
                              ? '${_rescheduledDate!.day} ${_monthShort(_rescheduledDate!.month)}, $_rescheduledSlot'
                              : '5 Feb, 11:00 AM',
                          style: TextStyle(
                            fontSize: baseSize * 0.028,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.01),

                  // Confirm + Reschedule buttons
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: h * 0.042,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/liked4.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'A',
                                fontSize: baseSize * 0.03,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: w * 0.025),
                      Expanded(
                        flex: 4,
                        child: GestureDetector(
                          onTap: () => _openRescheduleCalendar(context),
                          child: Container(
                            height: h * 0.042,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/liked5.png'),
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
                                  fontSize: baseSize * 0.028,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Completed Tab Content ───
  Widget _completedContent(double h, double w, double baseSize) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.05),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 0.5,
        ),
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

  // ─── Cancelled Tab Content ───
  Widget _cancelledContent(double h, double w, double baseSize) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(w * 0.05),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 0.5,
        ),
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
    final double avatarSize = size.width * 0.155;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: w * 0.04,
              right: w * 0.04,
              top: h * 0.015,
              bottom: h * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ─── Top Bar ───
                Row(
                  children: [
                    Container(
                      width: avatarSize,
                      height: avatarSize,
                      padding: EdgeInsets.all(size.width * 0.006),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: size.width * 0.004,
                        ),
                      ),child:
                    CircleAvatar(
                      radius: baseSize * 0.065,
                      backgroundImage: const AssetImage(
                        'assets/images/home2.jpg',
                      ),
                    ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: baseSize * 0.065,
                      backgroundColor: Colors.transparent,
                      backgroundImage:
                      const AssetImage('assets/images/liked1.png'),
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
                  'Check Out All your bookings Lists',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: baseSize * 0.038,
                    fontFamily: 'A',
                  ),
                ),

                SizedBox(height: h * 0.03),

                // ─── Tab Buttons ───
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _tabButton('Upcoming', h, w, baseSize),
                    SizedBox(width: w * 0.015),
                    _tabButton('Completed', h, w, baseSize),
                    SizedBox(width: w * 0.015),
                    _tabButton('Cancelled', h, w, baseSize),
                  ],
                ),

                SizedBox(height: h * 0.035),

                // ─── Tab Content with smooth fade ───
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                  child: KeyedSubtree(
                    key: ValueKey(_selectedTab),
                    child: _selectedTab == 'Upcoming'
                        ? _upcomingContent(h, w, baseSize)
                        : _selectedTab == 'Completed'
                        ? _completedContent(h, w, baseSize)
                        : _cancelledContent(h, w, baseSize),
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