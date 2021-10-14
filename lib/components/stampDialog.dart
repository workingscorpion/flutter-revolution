import 'package:revolution/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StampDialog extends StatelessWidget {
  const StampDialog({
    this.stamp,
    this.stampColor,
    this.stampBackgroundColor,
    this.topChild,
    this.bottomChild,
  });

  final String stamp;
  final Color stampColor;
  final Color stampBackgroundColor;
  final Widget topChild;
  final Widget bottomChild;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(8),
          ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contents(),
    );
  }

  contents() => Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 30),
        child: IntrinsicHeight(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('응모 완료'),
                          Text('이벤트가 참여 완료되었습니다.'),
                          Text('당첨이 되길 바라요!'),
                        ],
                      ),
                    ),
                    divider(),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('응모 완료'),
                          Text('이벤트가 참여 완료되었습니다.'),
                          Text('당첨이 되길 바라요!'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -35,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: stampBackgroundColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    'assets/components/stamp.svg',
                    color: stampColor,
                    height: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  divider() => Container(
        child: CustomPaint(
          painter: DotDivider(
            lineColor: Color(0xFFDEDEDE),
          ),
        ),
      );
}

class DotDivider extends CustomPainter {
  Paint _paint;

  final Color lineColor;

  DotDivider({
    this.lineColor = Colors.grey,
  }) {
    _paint = Paint()
      ..color = this.lineColor
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (double i = -300; i < 300; i = i + 15) {
      if (i % 3 == 0)
        canvas.drawLine(Offset(i, 0.0), Offset(i + 5, 0.0), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
