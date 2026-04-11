import 'package:beauty_related/custom_widgets/blackish_glass_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';
import '../../custom_widgets/glass_effect.dart';


class BookingDetailsReviewScreen extends StatefulWidget {
  final String serviceName;
  final String serviceDetail;
  final DateTime selectedDate;
  final String selectedTime;

  const BookingDetailsReviewScreen({
    super.key,
    required this.serviceName,
    required this.serviceDetail,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  State<BookingDetailsReviewScreen> createState() =>
      _BookingDetailsReviewScreenState();
}

class _BookingDetailsReviewScreenState
    extends State<BookingDetailsReviewScreen> {
  bool _agreedToTerms = true;

  double get servicePrice => 45.00;
  double get taxPrice => 0.00;
  double get totalPrice => servicePrice + taxPrice;

  String get formattedDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${widget.selectedDate.day} ${months[widget.selectedDate.month - 1]}, ${widget.selectedDate.year}';
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
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/helper1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
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
                      child: GlassCard1(
                        borderRadius: 100,
                        tintOpacity: 0.15,
                        child: SizedBox(
                          height: baseSize * 0.13,
                          width: baseSize * 0.13,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.asset(
                                  'assets/images/homeicon.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: baseSize * 0.06,
                              ),
                            ],
                          ),
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

              // ── Scrollable Content ──
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.045),
                  child: Column(
                    children: [
                      SizedBox(height: h * 0.005),

                      // ── Info Card ──
                      GlassCard1(
                        borderRadius: 32,
                        tintOpacity: 0.12,
                        padding: EdgeInsets.all(w * 0.035),
                        child: Column(
                          children: [
                            // Studio Row
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: baseSize * 0.28,
                                  width: baseSize * 0.22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Helper on Studio',
                                        style: TextStyle(
                                          fontFamily: 'A',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: baseSize * 0.048,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.003),
                                      Text(
                                        'Nails full beauty',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: baseSize * 0.032,
                                        ),
                                      ),
                                      SizedBox(height: h * 0.008),
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: baseSize * 0.036,
                                            backgroundImage: const AssetImage(
                                                'assets/images/home2.jpg'),
                                          ),
                                          SizedBox(width: w * 0.02),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nina',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: baseSize * 0.035,
                                                  fontFamily: 'A',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Owner',
                                                style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontSize: baseSize * 0.025,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Divider
                            Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: h * 0.015),
                              child: Divider(
                                color: Colors.white.withOpacity(0.35),
                                thickness: 1,
                              ),
                            ),

                            // Service & Date Row
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.content_cut_rounded,
                                        color:
                                        Colors.white.withOpacity(0.85),
                                        size: baseSize * 0.055,
                                      ),
                                      SizedBox(width: w * 0.025),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Service',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: baseSize * 0.028,
                                            ),
                                          ),
                                          Text(
                                            'Signature Haircut',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: baseSize * 0.034,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: baseSize * 0.1),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.access_time_filled,
                                        color:
                                        Colors.white.withOpacity(0.85),
                                        size: baseSize * 0.055,
                                      ),
                                      SizedBox(width: w * 0.025),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Date',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: baseSize * 0.028,
                                            ),
                                          ),
                                          Text(
                                            formattedDate,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: baseSize * 0.036,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.022),

                      // ── Payment Details Card ──
                      GlassCard1(
                        borderRadius: 32,
                        tintOpacity: 0.12,
                        padding: EdgeInsets.all(w * 0.05),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Details',
                              style: TextStyle(
                                fontFamily: 'A',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: baseSize * 0.048,
                              ),
                            ),
                            SizedBox(height: h * 0.018),

                            _PriceRow(
                              label: 'Service Price',
                              value: '\$${servicePrice.toStringAsFixed(2)}',
                              baseSize: baseSize,
                              isBold: false,
                            ),
                            SizedBox(height: h * 0.012),

                            _PriceRow(
                              label: 'Tax Price',
                              value: '\$${taxPrice.toStringAsFixed(2)}',
                              baseSize: baseSize,
                              isBold: false,
                            ),

                            Padding(
                              padding:
                              EdgeInsets.symmetric(vertical: h * 0.015),
                              child: Divider(
                                color: Colors.white.withOpacity(0.25),
                                thickness: 1,
                              ),
                            ),

                            _PriceRow(
                              label: 'Total Price',
                              value: '\$${totalPrice.toStringAsFixed(2)}',
                              baseSize: baseSize,
                              isBold: true,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: h * 0.022),

                      // ── Terms & Conditions ──
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => setState(
                                    () => _agreedToTerms = !_agreedToTerms),
                            child: GlassCard1(
                              borderRadius: 100,
                              tintOpacity: _agreedToTerms ? 0.20 : 0.08,
                              child: SizedBox(
                                height: baseSize * 0.06,
                                width: baseSize * 0.06,
                                child: _agreedToTerms
                                    ? Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: baseSize * 0.042,
                                )
                                    : null,
                              ),
                            ),
                          ),
                          SizedBox(width: w * 0.025),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  color: const Color(0xFF46151A),
                                  fontSize: baseSize * 0.031,
                                ),
                                children: const [
                                  TextSpan(text: 'I agree with all '),
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: TextStyle(
                                      color: Color(0xFF46151A),
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFF46151A),
                                    ),
                                  ),
                                  TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      color: Color(0xFF46151A),
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Color(0xFF46151A),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: h * 0.03),
                    ],
                  ),
                ),
              ),

              // ── Confirm Booking Button ──
              BottomAppBar(
                color: Colors.black.withOpacity(0.1),
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.bookingConfirm);
                    },
                    child: Container(
                      width: double.infinity,
                      height: h * 0.065,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image:
                          AssetImage('assets/images/buttonBG2.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Confirm Booking',
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Reusable Price Row ──
class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final double baseSize;
  final bool isBold;

  const _PriceRow({
    required this.label,
    required this.value,
    required this.baseSize,
    required this.isBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: baseSize * 0.038,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: baseSize * 0.038,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            fontFamily: isBold ? 'A' : null,
          ),
        ),
      ],
    );
  }
}