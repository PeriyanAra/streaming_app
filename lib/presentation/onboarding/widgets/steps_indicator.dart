import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:music_streaming_app/presentation/common/common.dart';

class StepsIndicator extends StatelessWidget {
  const StepsIndicator({
    super.key,
    required this.step,
  });

  final OnboardingSteps step;

  @override
  Widget build(BuildContext context) {
    final topBarSectionTheme = TopBarSectionTheme.of(context);

    return CustomPaint(
      size: Size(
        topBarSectionTheme.iconContainerSize,
        topBarSectionTheme.iconContainerSize,
      ),
      painter: CircleProgressPainter(
        progress: step.percent.toDouble() / 100,
        baseCircleColor: topBarSectionTheme.indicatorSectionPrimaryColor,
        progressCircleColor: topBarSectionTheme.indicatorSectionSecondaryColor,
      ),
      child: Container(
        height: topBarSectionTheme.iconContainerSize,
        width: topBarSectionTheme.iconContainerSize,
        alignment: Alignment.center,
        child: Text(
          '${step.percent}%',
          style: topBarSectionTheme.stepPercentTextStyle,
        ),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  CircleProgressPainter({
    required this.baseCircleColor,
    required this.progressCircleColor,
    required this.progress,
  });

  final double progress;
  final Color baseCircleColor;
  final Color progressCircleColor;

  @override
  void paint(Canvas canvas, Size size) {
    final baseCircle = Paint()
      ..strokeWidth = 1
      ..color = baseCircleColor
      ..style = PaintingStyle.stroke;

    final progressCircle = Paint()
      ..strokeWidth = 1
      ..color = progressCircleColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, baseCircle);

    final arcAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2),
      -math.pi / 2,
      arcAngle,
      false,
      progressCircle,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
