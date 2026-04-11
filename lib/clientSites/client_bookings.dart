import 'dart:ui';
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

  Widget _tabButton(String title, double h, double w, double baseSize) {
    final bool isSelected = _selectedTab == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = title),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: h * 0.05,
            width: w * 0.27,
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withOpacity(0.22)
                  : Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                  color: isSelected
                      ? Colors.white
                      : Colors.white.withOpacity(0.3),
                  width: isSelected ? 1.5 : 1.0),
            ),
            child: Center(
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'A',
                      fontSize: baseSize * 0.033)),
            ),
          ),
        ),
      ),
    );
  }

  String _monthShort(int month) {
    const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return months[month - 1];
  }

  void _openRescheduleCalendar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.78,
        minChildSize: 0.78,
        maxChildSize: 0.78,
        expand: false,
        builder: (_, sc) => ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
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
        ),
      ),
    );
  }

  Widget _upcomingContent(double h, double w, double baseSize) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: EdgeInsets.all(baseSize * 0.04),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('assets/images/homeicon2.jpg',
                    height: h * 0.085, width: w * 0.18, fit: BoxFit.cover),
              ),
              SizedBox(width: w * 0.025),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: h * 0.038,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/booking2.png'),
                                  fit: BoxFit.cover),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: w * 0.025),
                                child: Text('Upcoming',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'A',
                                        fontSize: baseSize * 0.03)),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text('\$45.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: baseSize * 0.036)),
                      ],
                    ),
                    SizedBox(height: h * 0.007),
                    Text('Helper on Studio',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'A',
                            fontSize: baseSize * 0.036),
                        overflow: TextOverflow.ellipsis),
                    SizedBox(height: h * 0.005),
                    Row(
                      children: [
                        Image.asset('assets/images/liked2.png',
                            height: baseSize * 0.04, width: baseSize * 0.04),
                        SizedBox(width: w * 0.01),
                        Flexible(
                            child: Text('Manicure',
                                style: TextStyle(
                                    fontSize: baseSize * 0.028,
                                    color: Colors.white70),
                                overflow: TextOverflow.ellipsis)),
                        SizedBox(width: w * 0.02),
                        Image.asset('assets/images/liked3.png',
                            height: baseSize * 0.04, width: baseSize * 0.04),
                        SizedBox(width: w * 0.01),
                        Flexible(
                          child: Text(
                            _rescheduledDate != null && _rescheduledSlot != null
                                ? '${_rescheduledDate!.day} ${_monthShort(_rescheduledDate!.month)}, $_rescheduledSlot'
                                : '5 Feb, 11:00 AM',
                            style: TextStyle(
                                fontSize: baseSize * 0.028,
                                color: Colors.white70),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: h * 0.01),
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
                                  fit: BoxFit.cover),
                            ),
                            child: Center(
                                child: Text('Confirm',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'A',
                                        fontSize: baseSize * 0.03))),
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
                                    fit: BoxFit.cover),
                              ),
                              child: Center(
                                  child: Text('Reschedule',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'A',
                                          fontSize: baseSize * 0.028))),
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
      ),
    );
  }

  Widget _emptyTabContent(String title, String message, double h, double w, double baseSize) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(h * 0.025),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.10),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: baseSize * 0.042,
                      fontFamily: 'A')),
              SizedBox(height: h * 0.01),
              Text(message,
                  style: TextStyle(
                      color: Colors.white60,
                      fontSize: baseSize * 0.033,
                      fontFamily: 'A')),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    final baseSize = size.shortestSide;
    final double avatarSize = w * 0.155;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: w * 0.04, right: w * 0.04,
                top: h * 0.015, bottom: h * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: avatarSize,
                      height: avatarSize,
                      padding: EdgeInsets.all(w * 0.006),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: w * 0.004),
                      ),
                      child: const CircleAvatar(
                          backgroundImage:
                          AssetImage('assets/images/home2.jpg')),
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
                Text('Bookings',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: baseSize * 0.055,
                        fontFamily: 'A')),
                Text('Check Out All your bookings Lists',
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                        fontSize: baseSize * 0.033,
                        fontFamily: 'A')),
                SizedBox(height: h * 0.025),
                Row(
                  children: [
                    _tabButton('Upcoming', h, w, baseSize),
                    SizedBox(width: w * 0.015),
                    _tabButton('Completed', h, w, baseSize),
                    SizedBox(width: w * 0.015),
                    _tabButton('Cancelled', h, w, baseSize),
                  ],
                ),
                SizedBox(height: h * 0.03),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, anim) =>
                      FadeTransition(opacity: anim, child: child),
                  child: KeyedSubtree(
                    key: ValueKey(_selectedTab),
                    child: _selectedTab == 'Upcoming'
                        ? _upcomingContent(h, w, baseSize)
                        : _selectedTab == 'Completed'
                        ? _emptyTabContent('Completed Bookings',
                        'You have no completed bookings yet.',
                        h, w, baseSize)
                        : _emptyTabContent('Cancelled Bookings',
                        'You have no cancelled bookings yet.',
                        h, w, baseSize),
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