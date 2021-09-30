import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  CircularProgress({
    this.percent,
    this.textScaleFactor,
    this.strokeWidth,
    this.width,
    this.height,
  });

  final double percent;
  final double textScaleFactor;
  final double strokeWidth;
  final double width;
  final double height;

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with TickerProviderStateMixin {
  // Animation<double> animation;
  // AnimationController controller;

  // Tween<double> tweens;

  // @override
  // void initState() {
  //   super.initState();

  //   // controller = AnimationController(
  //   //   vsync: this,
  //   //   duration: Duration(seconds: 1),
  //   // );

  //   // tweens = Tween(
  //   //   begin: -pi,
  //   //   end: min(
  //   //     widget.width / 2 - widget.strokeWidth / 2,
  //   //     widget.height / 2 - widget.strokeWidth / 2,
  //   //   ),
  //   // );

  //   // animation = tweens.animate(controller)
  //   //   ..addListener(() {
  //   //     setState(() {});
  //   //   })
  //   //   ..addStatusListener((status) {
  //   //     if (status == AnimationStatus.completed) {
  //   //       controller.repeat();
  //   //     } else if (status == AnimationStatus.dismissed) {
  //   //       controller.forward();
  //   //     }
  //   //   });

  //   // controller.forward();
  // }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(widget.width, widget.height),
        painter: PieChart(
          percent: widget.percent,
          textScaleFactor: widget.textScaleFactor,
        ),
      ),
    );
  }
}

class PieChart extends CustomPainter {
  PieChart({
    this.emptyColor = Colors.black12,
    this.color = Colors.blue,
    this.strokeWidth = 10,
    this.style = PaintingStyle.stroke,
    this.strokeCap = StrokeCap.round,
    this.percent = 0,
    this.textScaleFactor = 1.0,
    this.textColor = Colors.black,
  });

  final Color emptyColor;
  final Color color;
  final Color textColor;
  final double strokeWidth;
  final PaintingStyle style;
  final StrokeCap strokeCap;
  final double percent;
  final double textScaleFactor;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = emptyColor
      ..strokeWidth = strokeWidth
      ..style = style
      ..strokeCap = strokeCap;

    Offset center = Offset(
      size.width / 2,
      size.height / 2,
    );

    double radius = min(
      size.width / 2 - paint.strokeWidth / 2,
      size.height / 2 - paint.strokeWidth / 2,
    );

    // Path path = Path();
    // path.addOval(
    //   Rect.fromCircle(
    //     center: center,
    //     radius: 100,
    //   ),
    // );

    // canvas.drawPath(path, paint);

    canvas.drawCircle(center, radius, paint);

    double arcAngle = 2 * pi * (percent / 100);

    paint..color = color;

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      -pi / 2,
      arcAngle,
      false,
      paint,
    );

    drawText(canvas, size, "${percent.round()} / 100");
  }

  drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);

    TextPainter tp = TextPainter(
      text: TextSpan(
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
        text: text,
      ),
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  double getFontSize(Size size, String text) {
    return size.width / text.length * (textScaleFactor ?? 1.0);
  }

  @override
  bool shouldRepaint(PieChart old) {
    return old.percent != percent;
  }
}
