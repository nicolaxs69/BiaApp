import 'dart:math';

import 'package:flutter/material.dart';

// Custom painter for the lightning bol. Generated with https://fluttershapemaker.com/#/

class LigthningCustomPainter extends CustomPainter {
  final double animationValue;
  final double fillValue;

  LigthningCustomPainter(
      {required this.animationValue, required this.fillValue});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9948564, size.height * 0.3982911);
    path_0.cubicTo(
        size.width * 0.9864574,
        size.height * 0.3840420,
        size.width * 0.9690585,
        size.height * 0.3750429,
        size.width * 0.9500106,
        size.height * 0.3750429);
    path_0.lineTo(size.width * 0.5677766, size.height * 0.3750429);
    path_0.cubicTo(
        size.width * 0.5614309,
        size.height * 0.3750429,
        size.width * 0.5565000,
        size.height * 0.3704129,
        size.width * 0.5572021,
        size.height * 0.3651219);
    path_0.lineTo(size.width * 0.5996809, size.height * 0.04631518);
    path_0.cubicTo(
        size.width * 0.6021809,
        size.height * 0.02773304,
        size.width * 0.5894787,
        size.height * 0.01006754,
        size.width * 0.5686809,
        size.height * 0.003068040);
    path_0.cubicTo(
        size.width * 0.5478351,
        size.height * -0.004014808,
        size.width * 0.5239846,
        size.height * 0.001484817,
        size.width * 0.5103351,
        size.height * 0.01627549);
    path_0.lineTo(size.width * 0.01036324, size.height * 0.5579063);
    path_0.cubicTo(
        size.width * -0.001236101,
        size.height * 0.5704866,
        size.width * -0.003285995,
        size.height * 0.5874866,
        size.width * 0.005163532,
        size.height * 0.6017366);
    path_0.cubicTo(
        size.width * 0.01361303,
        size.height * 0.6160268,
        size.width * 0.03101207,
        size.height * 0.6250268,
        size.width * 0.05006101,
        size.height * 0.6250268);
    path_0.lineTo(size.width * 0.4322947, size.height * 0.6250268);
    path_0.cubicTo(
        size.width * 0.4386383,
        size.height * 0.6250268,
        size.width * 0.4435718,
        size.height * 0.6296563,
        size.width * 0.4428670,
        size.height * 0.6349464);
    path_0.lineTo(size.width * 0.4003915, size.height * 0.9537545);
    path_0.cubicTo(
        size.width * 0.3978915,
        size.height * 0.9723348,
        size.width * 0.4105910,
        size.height * 0.9900000,
        size.width * 0.4313894,
        size.height * 0.9970000);
    path_0.cubicTo(
        size.width * 0.4374394,
        size.height * 0.9990402,
        size.width * 0.4437888,
        size.height,
        size.width * 0.4500383,
        size.height);
    path_0.cubicTo(
        size.width * 0.4652378,
        size.height,
        size.width * 0.4800367,
        size.height * 0.9942098,
        size.width * 0.4896862,
        size.height * 0.9837500);
    path_0.lineTo(size.width * 0.9896596, size.height * 0.4421214);
    path_0.cubicTo(
        size.width * 1.001255,
        size.height * 0.4295388,
        size.width * 1.003255,
        size.height * 0.4125402,
        size.width * 0.9948564,
        size.height * 0.3982911);
    path_0.close();

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9948564, size.height * 0.3982911);
    path_1.cubicTo(
        size.width * 0.9864574,
        size.height * 0.3840420,
        size.width * 0.9690585,
        size.height * 0.3750429,
        size.width * 0.9500106,
        size.height * 0.3750429);
    path_1.lineTo(size.width * 0.5677766, size.height * 0.3750429);
    path_1.cubicTo(
        size.width * 0.5614309,
        size.height * 0.3750429,
        size.width * 0.5565000,
        size.height * 0.3704129,
        size.width * 0.5572021,
        size.height * 0.3651219);
    path_1.lineTo(size.width * 0.5996809, size.height * 0.04631518);
    path_1.cubicTo(
        size.width * 0.6021809,
        size.height * 0.02773304,
        size.width * 0.5894787,
        size.height * 0.01006754,
        size.width * 0.5686809,
        size.height * 0.003068040);
    path_1.cubicTo(
        size.width * 0.5478351,
        size.height * -0.004014808,
        size.width * 0.5239846,
        size.height * 0.001484817,
        size.width * 0.5103351,
        size.height * 0.01627549);
    path_1.lineTo(size.width * 0.01036324, size.height * 0.5579063);
    path_1.cubicTo(
        size.width * -0.001236101,
        size.height * 0.5704866,
        size.width * -0.003285995,
        size.height * 0.5874866,
        size.width * 0.005163532,
        size.height * 0.6017366);
    path_1.cubicTo(
        size.width * 0.01361303,
        size.height * 0.6160268,
        size.width * 0.03101207,
        size.height * 0.6250268,
        size.width * 0.05006101,
        size.height * 0.6250268);
    path_1.lineTo(size.width * 0.4322947, size.height * 0.6250268);
    path_1.cubicTo(
        size.width * 0.4386383,
        size.height * 0.6250268,
        size.width * 0.4435718,
        size.height * 0.6296563,
        size.width * 0.4428670,
        size.height * 0.6349464);
    path_1.lineTo(size.width * 0.4003915, size.height * 0.9537545);
    path_1.cubicTo(
        size.width * 0.3978915,
        size.height * 0.9723348,
        size.width * 0.4105910,
        size.height * 0.9900000,
        size.width * 0.4313894,
        size.height * 0.9970000);
    path_1.cubicTo(
        size.width * 0.4374394,
        size.height * 0.9990402,
        size.width * 0.4437888,
        size.height,
        size.width * 0.4500383,
        size.height);
    path_1.cubicTo(
        size.width * 0.4652378,
        size.height,
        size.width * 0.4800367,
        size.height * 0.9942098,
        size.width * 0.4896862,
        size.height * 0.9837500);
    path_1.lineTo(size.width * 0.9896596, size.height * 0.4421214);
    path_1.cubicTo(
        size.width * 1.001255,
        size.height * 0.4295388,
        size.width * 1.003255,
        size.height * 0.4125402,
        size.width * 0.9948564,
        size.height * 0.3982911);
    path_1.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffFFAA5B).withOpacity(0.2);
    canvas.drawPath(path_0, paint_0_fill);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffFFAA5B).withOpacity(1.0);

    canvas.clipPath(path_1);

    Paint wavePaint = Paint()
      ..color = Color(0xFFFFAA5B)
      ..style = PaintingStyle.fill;

    Path wavePath = Path();
    double heightParameter = size.height * 0.01;
    double periodParameter = 0.015;
    double waveSpeed = 2.0;

    double filledHeight = size.height * fillValue;
    double waveBaseY = size.height - filledHeight;

    // Wave animation, wave moves from right to left.
    // The wave is being drawn inside the lightning bolt shape from right to left.
    // This animation was achieved based on this post --> https://velog.io/@edge/Flutter-Wave-Animation-%EA%B5%AC%ED%98%84
    for (double i = 0; i <= size.width; i++) {
      double yOffset = heightParameter *
          sin(periodParameter * i - animationValue * waveSpeed * pi);
      wavePath.lineTo(i, waveBaseY + heightParameter + yOffset);
      if (i == 0) {
        wavePath.moveTo(0, waveBaseY + heightParameter + yOffset);
      }
    }
    wavePath.lineTo(size.width, size.height);
    wavePath.lineTo(0, size.height);
    wavePath.close();

    canvas.drawPath(wavePath, wavePaint);
  }

  @override
  bool shouldRepaint(covariant LigthningCustomPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
