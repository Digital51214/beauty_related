import 'package:flutter/material.dart';
import 'dart:ui';

/// Drop-in replacement for any glass container.
/// Wrap your child in GlassCard and you get the full SelectRole
/// quality: gradient shine, 4-side shimmering border, inner glow.
class GlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final double blurSigma;
  final Color? tintColor;
  final double tintOpacity;

  const GlassCard({
    super.key,
    required this.child,
    this.borderRadius = 30,
    this.padding,
    this.blurSigma = 12,
    this.tintColor,
    this.tintOpacity = 0.08,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: CustomPaint(
          painter: GlassPainter(borderRadius: borderRadius, tintColor: tintColor, tintOpacity: tintOpacity),
          child: padding != null
              ? Padding(padding: padding!, child: child)
              : child,
        ),
      ),
    );
  }
}

class GlassPainter extends CustomPainter {
  final double borderRadius;
  final Color? tintColor;
  final double tintOpacity;

  const GlassPainter({
    this.borderRadius = 30,
    this.tintColor,
    this.tintOpacity = 0.08,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final r = borderRadius;
    final rrect = RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(r));

    // 1. Base tint
    canvas.drawRRect(
      rrect,
      Paint()..color = (tintColor ?? Colors.white).withOpacity(tintOpacity),
    );

    // 2. Soft diagonal shine
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.22),
            Colors.white.withOpacity(0.06),
            Colors.transparent,
          ],
          stops: const [0.0, 0.35, 0.75],
        ).createShader(Offset.zero & size),
    );

    // 3. Top highlight streak
    final topStreak = RRect.fromRectAndCorners(
      Rect.fromLTWH(size.width * 0.15, 0, size.width * 0.70, 1.2),
      topLeft: Radius.circular(r),
      topRight: Radius.circular(r),
    );
    canvas.drawRRect(
      topStreak,
      Paint()
        ..shader = LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white.withOpacity(0.55),
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTWH(0, 0, size.width, 1.2)),
    );

    // 4. 4-side shimmer border
    canvas.drawRRect(
      rrect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white.withOpacity(0.55),
            Colors.white.withOpacity(0.18),
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.45),
          ],
          stops: const [0.0, 0.35, 0.65, 1.0],
        ).createShader(Offset.zero & size)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.1,
    );

    // 5. Inner glow border
    final innerRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(1.2, 1.2, size.width - 2.4, size.height - 2.4),
      Radius.circular(r - 1.5),
    );
    canvas.drawRRect(
      innerRRect,
      Paint()
        ..color = Colors.white.withOpacity(0.10)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 0.5,
    );
  }

  @override
  bool shouldRepaint(covariant GlassPainter old) =>
      old.borderRadius != borderRadius ||
          old.tintColor != tintColor ||
          old.tintOpacity != tintOpacity;
}
