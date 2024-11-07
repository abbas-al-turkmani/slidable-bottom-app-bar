import 'package:flutter/material.dart';

class RoundedFlatPainter extends CustomPainter {
  RoundedFlatPainter(
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

    double notchHeight = 72;

    double v1 = 0.42,
        v2 = 0.407,
        v3 = 0.3,
        v4 = 0.35,
        v5 = 0.4,
        v6 = 0.2,
        v7 = 0.68;

    double v1R = 1 - v1,
        v2R = 1 - v2,
        v3R = 1 - v3,
        v4R = 1 - v4,
        v5R = 1 - v5;

    Path path = Path();
    path.moveTo(0,notchHeight);
    path.lineTo(0,0);
    path.quadraticBezierTo(0,0,size.width*v3,0);
    path.cubicTo(size.width*v4,0,size.width*v5,0,size.width*v2,notchHeight*v6);
    path.cubicTo(size.width*v1,notchHeight*v7,size.width*v1R,notchHeight*v7,size.width*v2R,notchHeight*v6);
    path.cubicTo(size.width*v5R,0,size.width*v4R,0,size.width*v3R,0);
    path.quadraticBezierTo(0,0,size.width,0);
    path.lineTo(size.width,size.height);
    path.lineTo(0,size.height);

    path.close();
    canvas.drawPath(path, paint);

    if (allowShadow) canvas.drawShadow(path, shadowColor, 5, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
