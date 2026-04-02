import 'dart:ui';

import 'package:flutter/material.dart';

class CustomCalendarPicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime) onDateConfirmed;

  const CustomCalendarPicker({
    super.key,
    this.initialDate,
    required this.onDateConfirmed,
  });

  @override
  State<CustomCalendarPicker> createState() => _CustomCalendarPickerState();
}

class _CustomCalendarPickerState extends State<CustomCalendarPicker> {
  late DateTime _focusedMonth;
  DateTime? _selectedDate;

  final List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  final List<String> _monthNames = [
    'January', 'February', 'March', 'April',
    'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December',
  ];

  @override
  void initState() {
    super.initState();
    _focusedMonth = widget.initialDate ?? DateTime.now();
    _selectedDate = widget.initialDate;
  }

  List<DateTime?> _buildCalendarDays() {
    final firstDay = DateTime(_focusedMonth.year, _focusedMonth.month, 1);
    final int startOffset = _getGridIndex(firstDay.weekday);
    final int daysInMonth =
        DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0).day;

    final List<DateTime?> days = <DateTime?>[];
    for (int i = 0; i < startOffset; i++) days.add(null);
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(_focusedMonth.year, _focusedMonth.month, i));
    }
    return days;
  }

  int _getGridIndex(int weekday) {
    switch (weekday) {
      case 1: return 0; // Mon
      case 2: return 1; // Tue
      case 3: return 2; // Wed
      case 4: return 3; // Thu
      case 5: return 4; // Fri
      case 6: return 5; // Sat
      case 7: return 6; // Sun
      default: return 0;
    }
  }

  void _prevMonth() => setState(() {
    _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1, 1);
  });

  void _nextMonth() => setState(() {
    _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1, 1);
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final baseSize = size.shortestSide;
    final List<DateTime?> days = _buildCalendarDays();

    // ✅ FIX: Blur sirf calendar sheet ke peeche — ClipRRect se exact area clip kiya
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              // ✅ Thoda zyada opacity taake calendar readable rahe
              color: Colors.black.withOpacity(0.45),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
              border: Border.all(
                color: Colors.white.withOpacity(0.15),
                width: 0.5,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Header ──
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      w * 0.06, h * 0.025, w * 0.04, h * 0.01),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Date',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'A',
                              fontSize: baseSize * 0.065,
                            ),
                          ),
                          Text(
                            _monthNames[_focusedMonth.month - 1],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: baseSize * 0.045,
                              fontFamily: 'A',
                            ),
                          ),
                          Text(
                            '${_focusedMonth.year}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: baseSize * 0.05,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'A',
                              height: 1.1,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              height: baseSize * 0.12,
                              width: baseSize * 0.12,
                              decoration: BoxDecoration(
                                image:  DecorationImage(
                                  image: AssetImage('assets/images/calenderButtons.png'),
                                  fit: BoxFit.contain,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.15),
                              ),
                              child: Icon(Icons.close,
                                  color: Colors.white, size: baseSize * 0.045),
                            ),
                          ),
                          SizedBox(height: h * 0.01),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _prevMonth,
                                child: Container(
                                  height: baseSize * 0.1,
                                  width: baseSize * 0.1,
                                  decoration: BoxDecoration(
                                    image:  DecorationImage(
                                      image: AssetImage('assets/images/calenderButtons.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.15),
                                  ),
                                  child: Icon(Icons.chevron_left,
                                      color: Colors.white,
                                      size: baseSize * 0.055),
                                ),
                              ),
                              SizedBox(width: w * 0.025),
                              GestureDetector(
                                onTap: _nextMonth,
                                child: Container(
                                  height: baseSize * 0.1,
                                  width: baseSize * 0.1,
                                  decoration: BoxDecoration(
                                    image:  DecorationImage(
                                      image: AssetImage('assets/images/calenderButtons.png'),
                                      fit: BoxFit.contain,
                                    ),
                                    shape: BoxShape.circle,
                                    color: Colors.white.withOpacity(0.15),
                                  ),
                                  child: Icon(Icons.chevron_right,
                                      color: Colors.white,
                                      size: baseSize * 0.055),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.008),

                // ── Weekday Headers ──
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _weekDays
                        .map((day) => SizedBox(
                      width: baseSize * 0.1,
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: baseSize * 0.04,
fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                ),

                SizedBox(height: h * 0.008),

                // ── Calendar Grid ──
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.005),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 4,
                      childAspectRatio: 1,
                    ),
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      final DateTime? date = days[index];
                      if (date == null) return const SizedBox.shrink();
                      final bool selected = _isSelected(date);
                      final bool today = _isToday(date);

                      return GestureDetector(
                        onTap: () => setState(() => _selectedDate = date),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selected
                                ? const Color(0xFF46151A)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(
                                color: Colors.white.withOpacity(
                                    selected || today ? 1.0 : 0.85),
                                fontWeight: selected || today
                                    ? FontWeight.w700
                                    : FontWeight.w700,
                                fontSize: baseSize * 0.045,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: h * 0.015),

                // ── Confirm Button ──
                GestureDetector(
                  onTap: () {
                    if (_selectedDate != null) {
                      widget.onDateConfirmed(_selectedDate!);
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: h * 0.06,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/buttonBG2.png'),
                        fit: BoxFit.contain,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm Date',
                        style: TextStyle(
                          fontFamily: 'A',
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: baseSize * 0.045,
                        ),
                      ),
                    ),
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