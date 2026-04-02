import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../custom_widgets/custom_calender_picker.dart';
import 'booking_details_review_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  String? selectedService;
  String? selectedTime;
  DateTime? selectedDate;
  final TextEditingController _notesController = TextEditingController();

  final List<Map<String, String>> services = [
    {'name': 'Signature Haircut', 'detail': '60 min . \$45.00'},
    {'name': 'Hair Color', 'detail': '90 min . \$80.00'},
    {'name': 'Nail Art', 'detail': '45 min . \$30.00'},
  ];

  final List<String> timeSlots = [
    '09:00 AM', '10:00 AM', '11:00 AM',
    '12:00 PM', '01:00 PM', '02:00 PM',
    '03:00 PM', '04:00 PM',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _pickDate(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: CustomCalendarPicker(
          initialDate: selectedDate,
          onDateConfirmed: (date) {
            setState(() => selectedDate = date);
          },
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

    // ✅ FIX: Side padding kam ki — w * 0.035 (pehle w * 0.05 tha)
    // ✅ FIX: Vertical padding ek jaisa — h * 0.016 sab fields mein
    final BoxDecoration fieldDecoration = BoxDecoration(
      color: Colors.white.withOpacity(0.1),
      borderRadius: BorderRadius.circular(50),
      border: Border.all(
        color: Colors.white.withOpacity(0.2),
        width: 1.2,
      ),
    );

    // ✅ FIX: Field ka vertical padding fixed — uniform size ke liye
    final EdgeInsets fieldPadding = EdgeInsets.symmetric(
      horizontal: w * 0.035,  // pehle 0.05 tha, ab 0.035
      vertical: h * 0.016,    // sab fields mein same
    );

    final TextStyle labelStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: baseSize * 0.048,
    );

    final TextStyle hintStyle = TextStyle(
      color: Colors.white.withOpacity(0.55),
      fontSize: baseSize * 0.038,
    );

    // ✅ FIX: Uniform icon size sab fields mein
    final double fieldIconSize = baseSize * 0.055;

    // ✅ FIX: Uniform text style for selected values
    final TextStyle fieldValueStyle = TextStyle(
      color: Colors.white,
      fontSize: baseSize * 0.04,

    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top Bar ──
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * 0.045,
                  vertical: h * 0.018,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        height: baseSize * 0.13,
                        width: baseSize * 0.13,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage('assets/images/homeicon.png'),fit: BoxFit.contain,),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: baseSize * 0.06,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Book Appointment',
                      style: TextStyle(
                        fontFamily: 'A',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: baseSize * 0.057,
                      ),
                    ),
                    const Spacer(),
                    Image.asset(
                      "assets/images/MainLogo.png",
                      height: baseSize * 0.13,
                      width: baseSize * 0.13,
                    ),
                  ],
                ),
              ),

              SizedBox(height: h * 0.01),

              // ── Scrollable Body ──
              Expanded(
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.only(
                    left: w * 0.045,
                    right: w * 0.045,
                    bottom:
                    MediaQuery.of(context).viewInsets.bottom + h * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Info Card ──
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                            width: 1.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: baseSize * 0.26,
                                width: baseSize * 0.22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35),
                                  color: Colors.black.withOpacity(0.3),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.15),
                                    width: 1.5,
                                  ),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/homeicon3.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: w * 0.04),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Helper on Studio',
                                      style: TextStyle(
                                        fontFamily: 'A',
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: baseSize * 0.045,
                                      ),
                                    ),
                                    SizedBox(height: h * 0.005),
                                    Text(
                                      'Nails full beauty',
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.75),
                                        fontSize: baseSize * 0.032,
                                      ),
                                    ),
                                    SizedBox(height: h * 0.005),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: baseSize * 0.036,
                                          backgroundImage: const AssetImage(
                                              'assets/images/home2.jpg'),
                                        ),
                                        SizedBox(width: w * 0.02),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: baseSize * 0.009),
                                          child: Column(
                                            children: [
                                              Text(
                                                'Nina',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: baseSize * 0.035,
                                                  fontFamily: 'A',
                                                ),
                                              ),
                                              Text(
                                                'Owner',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: baseSize * 0.025,
                                                ),
                                              ),
                                            ],
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

                      SizedBox(height: h * 0.02),

                      // ── Form Card ──
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.03,
                          vertical: h * 0.025,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.15),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // ── Select Service ──
                            Text('Select Service', style: labelStyle),
                            SizedBox(height: h * 0.012),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: const Color(0xFF46151A),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24)),
                                  ),
                                  builder: (_) => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: services.length,
                                    itemBuilder: (_, i) => ListTile(
                                      title: Text(services[i]['name']!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'A')),
                                      subtitle: Text(services[i]['detail']!,
                                          style: TextStyle(
                                              color: Colors.white
                                                  .withOpacity(0.6))),
                                      onTap: () {
                                        setState(() => selectedService =
                                        services[i]['name']);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 55,
                                padding:EdgeInsets.only(left: w * 0.035, right: w * 0.035),
                                decoration: fieldDecoration,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            selectedService ?? 'Signature Haircut',
                                            style: fieldValueStyle,
                                          ),
                                          Text('60 min . \$45.00',
                                              style: hintStyle),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: fieldIconSize),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: h * 0.015),

                            // ── Select Date ──
                            Text('Select Date', style: labelStyle),
                            SizedBox(height: h * 0.012),
                            GestureDetector(
                              onTap: () => _pickDate(context),
                              child: Container(
                                padding: fieldPadding, // ✅ uniform padding
                                decoration: fieldDecoration,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        selectedDate != null
                                            ? '${selectedDate!.day} / ${selectedDate!.month} / ${selectedDate!.year}'
                                            : 'Select Date',
                                        style: selectedDate != null
                                            ? fieldValueStyle
                                            : hintStyle,
                                      ),
                                    ),
                                    Icon(Icons.calendar_month_outlined,
                                        color: Colors.white,
                                        size: fieldIconSize),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: h * 0.015),

                            // ── Select Time Slot ──
                            Text('Select Time Slot', style: labelStyle),
                            SizedBox(height: h * 0.012),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: const Color(0xFF46151A),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(24)),
                                  ),
                                  builder: (_) => ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: timeSlots.length,
                                    itemBuilder: (_, i) => ListTile(
                                      title: Text(timeSlots[i],
                                          style: const TextStyle(
                                              color: Colors.white,
                                             )),
                                      onTap: () {
                                        setState(
                                                () => selectedTime = timeSlots[i]);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: fieldPadding, // ✅ uniform padding
                                decoration: fieldDecoration,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        selectedTime ?? 'Select Time',
                                        style: selectedTime != null
                                            ? fieldValueStyle
                                            : hintStyle,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                        size: fieldIconSize),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: h * 0.015),

                            // ── Notes ──
                            Text('Notes', style: labelStyle),
                            SizedBox(height: h * 0.012),
                            Container(
                              height: baseSize*0.2,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.2),
                                  width: 1.2,
                                ),
                              ),
                              child: TextField(
                                controller: _notesController,
                                maxLines: 4,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: baseSize * 0.038,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Write Notes.....',
                                  hintStyle: hintStyle,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: w * 0.035, // ✅ side padding kam
                                    vertical: h * 0.015,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),

                            SizedBox(height: h * 0.03),

                            // ── Next Button ──
                            GestureDetector(

                              onTap: () {
                               Get.toNamed(AppRoutes.bookingDetailsReview);

                              },
                              child: Container(
                                width: double.infinity,
                                height: h * 0.06,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/buttonBG2.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      fontFamily: 'A',
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: baseSize * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.03),
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