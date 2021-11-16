import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vectorMath;

class Roulette extends StatefulWidget {
  Roulette({Key key}) : super(key: key);

  @override
  _RouletteState createState() => _RouletteState();
}

class _RouletteState extends State<Roulette>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    setController();
    super.initState();
  }

  setController() {
    controller =
        AnimationController(duration: Duration(milliseconds: 2000), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reset();
            }
          });
  }

  spin() {
    // TODO: random
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => spin(),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 3.0).animate(controller),
        child: roulette(),
      ),
    );
  }

  roulette() => Container(
        child: CustomPaint(
          size: Size(150, 150),
          painter: RoulettePainter(percent: 12.5),
        ),
      );
}

class RoulettePainter extends CustomPainter {
  RoulettePainter({this.percent});

  final double percent;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(0.0, size.width);
    canvas.rotate(vectorMath.radians(-90.0));

    Paint emptyPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = size.width / 3
      // ..strokeWidth = 50
      ..style = PaintingStyle.stroke;
    // ..strokeCap = StrokeCap.round;

    Offset center = Offset(
      size.width / 2,
      size.height / 2,
    );

    double radius = min(
      size.width / 2 - emptyPaint.strokeWidth / 2,
      size.height / 2 - emptyPaint.strokeWidth / 2,
    );

    canvas.drawCircle(center, radius, emptyPaint);

    var previousArc = 0.0;
    for (var i = 0; i < 100 / percent; i++) {
      Paint paint = Paint()
        ..strokeCap = emptyPaint.strokeCap
        ..strokeWidth = emptyPaint.strokeWidth
        ..style = emptyPaint.style
        ..strokeCap = emptyPaint.strokeCap
        ..color = i % 2 == 1 ? Colors.red : Colors.yellow;

      double arcAngle = 2 * pi * (percent / 100);
      // double arcAngle = 2 * pi * (percent / 100);

      // paint..color = ;

      canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        previousArc,
        // 0.0,
        arcAngle,
        false,
        paint,
      );
      previousArc = (2 * pi * (percent / 100) * (i + 1));
      print(previousArc);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(RoulettePainter oldDelegate) {
    // return old.percent != percent;
    return oldDelegate.percent != percent;
    // throw UnimplementedError();
  }
}
