import 'package:flutter/material.dart';
import 'package:revolution/constants/lotteryType.dart';

class Lottery extends StatefulWidget {
  Lottery({
    this.value = "Bang",
    this.type = LotteryType.TEXT,
  });

  final String value;
  final LotteryType type;

  @override
  _LotteryState createState() => _LotteryState();
}

class _LotteryState extends State<Lottery> {
  Widget getChild() {
    switch (widget.type) {
      case LotteryType.TEXT:
        return Text(widget.value);
      case LotteryType.IMAGE:
        return Image.asset(widget.value);
      default:
        return Text(widget.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      // decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: getChild(),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onPanDown: (detail) {
              print(detail);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class ScratchCard extends CustomPainter {
//   final ui.Image imagePath;
//   List<Offset> points;
//   ScratchCard({Key key, this.imagePath, this.points}) : super();
//   Paint _paint = Paint();

//   Rect rect, inputSubrect, outputSubrect;
//   Path path = new Path();
//   Paint paint1 = new Paint();
//   @override
//   void paint(Canvas canvas, Size size) {
//     _paint.blendMode = BlendMode.src;
//     if (imagePath != null)
//       canvas.drawImage(imagePath, Offset(10.0, 100.0), _paint);
//     Paint paint = new Paint()
//       ..color = Colors.white
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 30.0;
//     _paint.blendMode = BlendMode.clear;
//     for (int i = 0; i < points.length - 1; i++) {
//       if (points[i] != null && points[i + 1] != null) {
//         canvas.drawLine(points[i], points[i + 1], paint);
//         path.reset();
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(ScratchCard oldDelegate) {
//     return true;
//   }
// }
