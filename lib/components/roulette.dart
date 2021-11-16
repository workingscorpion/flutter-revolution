import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revolution/model/rouletteData.dart';
import 'package:vector_math/vector_math.dart' as vectorMath;

class Roulette extends StatefulWidget {
  Roulette({
    this.data,
    this.width = 200,
    this.height = 200,
    this.spinCount = 7.0,
    this.duration,
    this.onEnd,
  });

  final List<RouletteData> data;
  final double width;
  final double height;
  final double spinCount;
  final Duration duration;
  final Function(RouletteData) onEnd;

  @override
  _RouletteState createState() => _RouletteState();
}

class _RouletteState extends State<Roulette>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double endValue;
  RouletteData selectedItem;

  @override
  void initState() {
    setController();
    super.initState();
  }

  setController() {
    controller = AnimationController(
        duration: widget.duration ?? Duration(milliseconds: 6000), vsync: this);
  }

  spin() {
    controller.reset();
    final _randomValue = Random().nextInt(1000);
    endValue = widget.spinCount + _randomValue * 0.001;
    final value = _randomValue * 0.1;

    double minimum = 0.0;
    double maximum = 0.0;
    for (var datum in widget.data) {
      maximum += datum.percent;
      if (value >= minimum && value < maximum) {
        selectedItem = datum;
      }
      minimum += datum.percent;
    }
    setState(() {});
    controller.forward();
    Future.delayed((widget.duration ?? Duration(milliseconds: 6000)),
        () => widget.onEnd(selectedItem));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => spin(),
      child: RotationTransition(
        turns: Tween(
          begin: 0.0,
          end: (endValue ?? 0.0) * -1,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOutCubic,
        )),
        child: roulette(),
      ),
    );
  }

  roulette() => Container(
        child: CustomPaint(
          size: Size(widget.width, widget.height),
          painter: RoulettePainter(
            data: widget.data,
          ),
        ),
      );
}

class RoulettePainter extends CustomPainter {
  RoulettePainter({this.data});

  final List<RouletteData> data;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(0.0, size.width);
    canvas.rotate(vectorMath.radians(-90.0));

    Paint emptyPaint = Paint()
      // ..color = Colors.blue
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
    for (var datum in data) {
      Paint paint = Paint()
        ..strokeCap = emptyPaint.strokeCap
        ..strokeWidth = emptyPaint.strokeWidth
        ..style = emptyPaint.style
        ..strokeCap = emptyPaint.strokeCap
        ..color = datum.color;
      double arcAngle = 2 * pi * (datum.percent / 100);

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

      previousArc += arcAngle;
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(RoulettePainter oldDelegate) {
    return oldDelegate.data != data;
  }
}
