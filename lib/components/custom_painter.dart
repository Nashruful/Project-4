import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(235.972, 0.0029814);
    path_0.cubicTo(307.382, -0.252306, 383.329, 15.8226, 426.043, 73.05);
    path_0.cubicTo(467.592, 128.715, 454.259, 203.206, 438.06, 270.752);
    path_0.cubicTo(422.165, 337.03, 400.15, 408.462, 338.589, 437.715);
    path_0.cubicTo(277.285, 466.845, 208.14, 438.849, 147.199, 408.965);
    path_0.cubicTo(86.9911, 379.44, 28.6074, 340.594, 9.47353, 276.324);
    path_0.cubicTo(-11.0889, 207.255, 1.91218, 130.136, 47.5965, 74.4029);
    path_0.cubicTo(92.6243, 19.4704, 164.943, 0.256903, 235.972, 0.0029814);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffA2CA71).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
