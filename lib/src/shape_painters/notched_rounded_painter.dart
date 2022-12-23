import 'package:flutter/material.dart';

class NotchedRoundedPainter extends CustomPainter {
  NotchedRoundedPainter(
    this.color,
    this.allowShadow,
    this.shadowColor,
    this.hasCenterButton,
  );

  final Color color;
  final Color shadowColor;

  final bool allowShadow;
  final bool hasCenterButton;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    double zero = 0,
        x1 = size.width * 0.01,
        x2 = size.width * 0.1,
        x3 = size.width * 0.4,
        x4 = size.width * 0.6,
        x5 = size.width * 0.65,
        x6 = size.width * 0.9,
        x7 = size.width * 0.99,
        y1 = size.height * 0.3,
        y2 = size.height * 0.5;

    Path path = Path()..moveTo(zero, y2);

    path.quadraticBezierTo(x1, zero, x2, zero);
    path.lineTo(size.width * 0.35, zero);
    path.quadraticBezierTo(x3, zero, x3, hasCenterButton ? y2 : zero);

    if (hasCenterButton) {
      path.arcToPoint(Offset(x4, y1),
          radius: const Radius.circular(10), clockwise: false);
    }

    path.quadraticBezierTo(x4, zero, x5, zero);
    path.lineTo(x6, zero);
    path.quadraticBezierTo(x7, zero, size.width, y2);

    path.lineTo(size.width, size.height);
    path.lineTo(zero, size.height);

    path.close();

    canvas.drawPath(path, paint);

    if (allowShadow) canvas.drawShadow(path, shadowColor, 5, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
