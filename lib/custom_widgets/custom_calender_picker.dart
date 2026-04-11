import 'dart:ui';

import 'package:beauty_related/custom_widgets/blackish_glass_effect.dart';
import 'package:flutter/material.dart';

import 'glass_effect.dart';



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

  final List<String> _weekDays = [
    'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'
  ];

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
      case 1: return 0;
      case 2: return 1;
      case 3: return 2;
      case 4: return 3;
      case 5: return 4;
      case 6: return 5;
      case 7: return 6;
      default: return 0;
    }
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    final baseSize = size.shortestSide;
    final List<DateTime?> days = _buildCalendarDays();

    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              // Slightly more visible tint so dates are readable
              color: Colors.black.withOpacity(0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: CustomPaint(
              // GlassPainter for the shimmer border + shine on top portion
              painter: _TopRoundedGlassPainter(),
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
                        // Month / Year labels
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

                        // Close + nav buttons
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Close button
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: GlassCard1(
                                borderRadius: 100,
                                tintOpacity: 0.15,
                                child: SizedBox(
                                  height: baseSize * 0.12,
                                  width: baseSize * 0.12,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [

                                      Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: baseSize * 0.045,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: h * 0.01),

                            // Prev / Next buttons
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _prevMonth,
                                  child: GlassCard1(
                                    borderRadius: 100,
                                    tintOpacity: 0.15,
                                    child: SizedBox(
                                      height: baseSize * 0.1,
                                      width: baseSize * 0.1,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [

                                          Icon(
                                            Icons.chevron_left,
                                            color: Colors.white,
                                            size: baseSize * 0.055,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: w * 0.025),
                                GestureDetector(
                                  onTap: _nextMonth,
                                  child: GlassCard1(
                                    borderRadius: 100,
                                    tintOpacity: 0.15,
                                    child: SizedBox(
                                      height: baseSize * 0.1,
                                      width: baseSize * 0.1,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [

                                          Icon(
                                            Icons.chevron_right,
                                            color: Colors.white,
                                            size: baseSize * 0.055,
                                          ),
                                        ],
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

                  SizedBox(height: h * 0.008),

                  // ── Weekday Headers ──
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: _weekDays
                          .map(
                            (day) => SizedBox(
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
                        ),
                      )
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
                          onTap: () =>
                              setState(() => _selectedDate = date),
                          child: selected
                          // Selected date → solid brand colour with glass shine
                              ? GlassCard(
                            borderRadius: 100,
                            tintColor: const Color(0xFF46151A),
                            tintOpacity: 0.85,
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: baseSize * 0.045,
                                ),
                              ),
                            ),
                          )
                          // Today → subtle glass highlight
                              : today
                              ? GlassCard(
                            borderRadius: 100,
                            tintOpacity: 0.18,
                            child: Center(
                              child: Text(
                                '${date.day}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: baseSize * 0.045,
                                ),
                              ),
                            ),
                          )
                          // Normal date
                              : Center(
                            child: Text(
                              '${date.day}',
                              style: TextStyle(
                                color:
                                Colors.white.withOpacity(0.85),
                                fontWeight: FontWeight.w700,
                                fontSize: baseSize * 0.045,
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
                          image:
                          AssetImage('assets/images/buttonBG2.png'),
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
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────
// Custom painter that replicates GlassPainter but only draws the
// top-rounded corners (bottomLeft/Right stay square so the confirm
// button sits flush).
// ─────────────────────────────────────────────────────────────────
class _TopRoundedGlassPainter extends CustomPainter {
  const _TopRoundedGlassPainter();

  @override
  void paint(Canvas canvas, Size size) {
    const r = 28.0;
    final rrect = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: const Radius.circular(r),
      topRight: const Radius.circular(r),
    );

    // Diagonal shine
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.18),
            Colors.white.withOpacity(0.05),
            Colors.transparent,
          ],
          stops: const [0.0, 0.3, 0.7],
        ).createShader(Offset.zero & size),
    );

    // Top highlight streak
    final topStreak = RRect.fromRectAndCorners(
      Rect.fromLTWH(size.width * 0.15, 0, size.width * 0.70, 1.2),
      topLeft: const Radius.circular(r),
      topRight: const Radius.circular(r),
    );
    canvas.drawRRect(
      topStreak,
      Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.50),
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, 1.2)),
    );

    // Shimmer border (top + sides only)
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.50),
            Colors.white.withOpacity(0.15),
            Colors.white.withOpacity(0.07),
            Colors.white.withOpacity(0.40),
          ],
          stops: const [0.0, 0.35, 0.65, 1.0],
        ).createShader(Offset.zero & size)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.0,
    );

    // Inner glow
    final inner = RRect.fromRectAndCorners(
      Rect.fromLTWH(1.2, 1.2, size.width - 2.4, size.height - 1.2),
      topLeft: const Radius.circular(r - 1.5),
      topRight: const Radius.circular(r - 1.5),
    );
    canvas.drawRRect(
      inner,
      Paint()
        ..color = Colors.white.withOpacity(0.08)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );
  }

  @override
  bool shouldRepaint(covariant _TopRoundedGlassPainter old) => false;
}