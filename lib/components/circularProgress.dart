import 'dart:math';
// import 'dart:ui' as ui;
import 'package:vector_math/vector_math.dart' as vectorMath;
import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  CircularProgress({
    this.percent,
    this.textScaleFactor,
    this.strokeWidth,
    this.width,
    this.height,
    this.color = Colors.blue,
    this.startColor,
    this.endColor,
  });

  final double percent;
  final double textScaleFactor;
  final double strokeWidth;
  final double width;
  final double height;
  final Color color;
  final Color startColor;
  final Color endColor;

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress>
    with TickerProviderStateMixin {
  double percent = 0;

  @override
  void initState() {
    super.initState();
    increase();
  }

  increase() async {
    for (var i = 0; i <= widget.percent; i++) {
      await Future.delayed(Duration(milliseconds: 10), () {
        percent = i.toDouble();
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(widget.width, widget.height),
        painter: PieChart(
          percent: percent,
          textScaleFactor: widget.textScaleFactor,
          color: widget.color,
          startColor: widget.startColor,
          endColor: widget.endColor,
          strokeWidth: widget.strokeWidth,
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
    this.startColor,
    this.endColor,
  });

  final Color emptyColor;
  final Color color;
  final Color textColor;
  final double strokeWidth;
  final PaintingStyle style;
  final StrokeCap strokeCap;
  final double percent;
  final double textScaleFactor;
  final Color startColor;
  final Color endColor;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.translate(0.0, size.width);
    canvas.save();
    canvas.translate(0.0, size.width);
    canvas.rotate(vectorMath.radians(-90.0));

    Paint emptyPaint = Paint()
      ..color = emptyColor
      ..strokeWidth = strokeWidth
      ..style = style
      ..strokeCap = strokeCap;

    Offset center = Offset(
      size.width / 2,
      size.height / 2,
    );

    double radius = min(
      size.width / 2 - emptyPaint.strokeWidth / 2,
      size.height / 2 - emptyPaint.strokeWidth / 2,
    );

    canvas.drawCircle(center, radius, emptyPaint);

    Paint paint = Paint()
      ..strokeCap = emptyPaint.strokeCap
      ..strokeWidth = emptyPaint.strokeWidth
      ..style = emptyPaint.style
      ..strokeCap = emptyPaint.strokeCap;

    double arcAngle = 2 * pi * (percent / 100);

    if (startColor != null && endColor != null) {
      paint
        ..shader = SweepGradient(
          colors: [
            startColor,
            endColor,
          ],
        ).createShader(
          Rect.fromCircle(
            center: center,
            radius: radius,
          ),
        );
    } else {
      paint..color = color;
    }

    // canvas.drawArc(
    //     arcRect, 0.0, vectorMath.radians(angle), false, paint);

    canvas.drawArc(
      Rect.fromCircle(
        center: center,
        radius: radius,
      ),
      0.0,
      arcAngle,
      false,
      paint,
    );
    canvas.restore();

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
