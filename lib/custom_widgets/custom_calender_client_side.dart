import 'dart:ui';
import 'package:flutter/material.dart';

class CustomCalendarClientPicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime, String?) onDateConfirmed;

  const CustomCalendarClientPicker({
    super.key,
    this.initialDate,
    required this.onDateConfirmed,
  });

  @override
  State<CustomCalendarClientPicker> createState() =>
      _CustomCalendarClientPickerState();
}

class _CustomCalendarClientPickerState
    extends State<CustomCalendarClientPicker> {
  late DateTime _focusedMonth;
  DateTime? _selectedDate;
  String? _selectedSlot;

  final List<String> _weekDays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

  final List<String> _monthNames = [
    'January', 'February', 'March', 'April',
    'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December',
  ];

  final List<Map<String, dynamic>> _timeSlots = [
    {'time': '09:00 Am', 'isBooked': false},
    {'time': '10:00 Am', 'isBooked': true},
    {'time': '11:00 Am', 'isBooked': false},
    {'time': '12:00 Pm', 'isBooked': false},
    {'time': '01:00 Pm', 'isBooked': true},
    {'time': '02:00 Pm', 'isBooked': false},
    {'time': '03:00 Pm', 'isBooked': false},
    {'time': '04:00 Pm', 'isBooked': true},
    {'time': '05:00 Pm', 'isBooked': false},
  ];

  @override
  void initState() {
    super.initState();
    _focusedMonth = widget.initialDate ?? DateTime.now();
    _selectedDate = widget.initialDate;
  }

  List<DateTime?> _buildCalendarDays() {
    final firstDay =
    DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final int startOffset = _getGridIndex(firstDay.weekday);
    final int daysInMonth =
        DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0).day;

    final List<DateTime?> days = [];
    for (int i = 0; i < startOffset; i++) days.add(null);
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(_focusedMonth.year, _focusedMonth.month, i));
    }
    return days;
  }

  int _getGridIndex(int weekday) {
    return (weekday - 1).clamp(0, 6);
  }

  void _prevMonth() => setState(() {
    _focusedMonth =
        DateTime(_focusedMonth.year, _focusedMonth.month - 1, 1);
  });

  void _nextMonth() => setState(() {
    _focusedMonth =
        DateTime(_focusedMonth.year, _focusedMonth.month + 1, 1);
  });

  bool _isSelected(DateTime? date) {
    if (date == null || _selectedDate == null) return false;
    return date.year == _selectedDate!.year &&
        date.month == _selectedDate!.month &&
        date.day == _selectedDate!.day;
  }

  bool _isToday(DateTime? date) {
    if (date == null) return false;
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  String _formatSelectedDate() {
    if (_selectedDate == null) return 'Time Slots';
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return 'Time Slots — ${months[_selectedDate!.month - 1]} ${_selectedDate!.day}';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final baseSize = size.shortestSide;
    final List<DateTime?> days = _buildCalendarDays();

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/calenderBG.png'),
                    fit: BoxFit.cover,),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.6),
                    width: 1,
                  ),
                ),
                // ── Everything is inside a single scrollable list ──
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: h * 0.015),

                        // ── Header Row ──
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left: Title + Month + Year
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Manage Availability',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'A',
                                      fontSize: baseSize * 0.055,
                                    ),
                                  ),
                                  SizedBox(height: h * 0.003),
                                  Text(
                                    _monthNames[_focusedMonth.month - 1],
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.75),
                                      fontSize: baseSize * 0.038,
                                      fontFamily: 'A',
                                    ),
                                  ),
                                  Text(
                                    '${_focusedMonth.year}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: baseSize * 0.042,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'A',
                                      height: 1.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Right: Close + Nav arrows
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: Container(
                                    height: baseSize * 0.1,
                                    width: baseSize * 0.1,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.15),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/calenderButtons.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: baseSize * 0.038,
                                    ),
                                  ),
                                ),
                                SizedBox(height: h * 0.008),
                                Row(
                                  children: [
                                    _navButton(Icons.chevron_left, _prevMonth, baseSize),
                                    SizedBox(width: w * 0.025),
                                    _navButton(Icons.chevron_right, _nextMonth, baseSize),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.015),

                        // ── Weekday Headers ──
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: _weekDays
                              .map(
                                (day) => SizedBox(
                              width: baseSize * 0.09,
                              child: Center(
                                child: Text(
                                  day,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: baseSize * 0.032,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          )
                              .toList(),
                        ),

                        SizedBox(height: h * 0.006),

                        // ── Calendar Grid ──
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 7,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 2,
                            childAspectRatio: 1,
                          ),
                          itemCount: days.length,
                          itemBuilder: (context, index) {
                            final DateTime? date = days[index];
                            if (date == null) return const SizedBox.shrink();
                            final bool selected = _isSelected(date);
                            final bool today = _isToday(date);

                            return GestureDetector(
                              onTap: () => setState(() {
                                _selectedDate = date;
                                _selectedSlot = null;
                              }),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: selected
                                      ? const Color(0xFF46151A)
                                      : Colors.transparent,
                                  border: today && !selected
                                      ? Border.all(
                                      color: Colors.white.withOpacity(0.5),
                                      width: 1)
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    '${date.day}',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(
                                          selected || today ? 1.0 : 0.85),
                                      fontWeight: FontWeight.w700,
                                      fontSize: baseSize * 0.034,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),




                        // ── Time Slots Title ──
                        Text(
                          _formatSelectedDate(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'A',
                            fontSize: baseSize * 0.04,
                          ),
                        ),

                        SizedBox(height: h * 0.01),

                        // ── Time Slots Grid ──
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.7,
                          ),
                          itemCount: _timeSlots.length,
                          itemBuilder: (context, index) {
                            final slot = _timeSlots[index];
                            final bool isBooked = slot['isBooked'] as bool;
                            final String time = slot['time'] as String;
                            final bool isSlotSelected = _selectedSlot == time;

                            return GestureDetector(
                              onTap: isBooked
                                  ? null
                                  : () => setState(
                                      () => _selectedSlot = time),
                              child: Container(
                                height: h * 0.08,
                                decoration: BoxDecoration(
                                  color: isSlotSelected
                                      ? const Color(0xFF46151A)
                                      : Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSlotSelected
                                        ? const Color(0xFF46151A)
                                        : Colors.white.withOpacity(0.12),
                                    width: 0.8,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      time,
                                      style: TextStyle(
                                        color: isBooked
                                            ? Colors.white.withOpacity(0.4)
                                            : Colors.white,
                                        fontSize: baseSize * 0.035,fontFamily: 'A',

                                        fontWeight: FontWeight.w600,
                                        decoration: isBooked
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                        decorationColor:
                                        Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      isBooked ? 'Booked' : 'Available',
                                      style: TextStyle(
                                        color: isBooked
                                            ? Colors.white.withOpacity(0.35)
                                            : Colors.white.withOpacity(0.65),
                                        fontSize: baseSize * 0.025,
                                        fontFamily: 'A',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),



                        // ── Confirm Button — inside scroll at bottom ──
                        GestureDetector(
                          onTap: () {
                            if (_selectedDate != null) {
                              widget.onDateConfirmed(_selectedDate!, _selectedSlot);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: h * 0.06,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/buttonBG2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Confirm',
                                style: TextStyle(
                                  fontFamily: 'A',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: baseSize * 0.042,
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: h * 0.06),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─── Nav Arrow Button ───
  Widget _navButton(IconData icon, VoidCallback onTap, double baseSize) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: baseSize * 0.088,
        width: baseSize * 0.088,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.15),
          image: const DecorationImage(
            image: AssetImage('assets/images/calenderButtons.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Icon(icon, color: Colors.white, size: baseSize * 0.045),
      ),
    );
  }
}