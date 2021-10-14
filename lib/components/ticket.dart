import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  Ticket({
    this.borderRadius = 0,
    this.punchRadius = 10,
    this.topChild,
    this.bottomChild,
  });

  final double borderRadius;
  final double punchRadius;
  final Widget topChild;
  final Widget bottomChild;

  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      // mainAxisSize: MainAxisSize.min,
      children: [
        ClipPath(
          clipper: TicketClipper(punchRadius: widget.punchRadius),
          child: Column(
            children: [
              Container(
                width: 300,
                child: widget.topChild,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                ),
              ),
              SizedBox(
                width: 300,
                child: Container(
                  color: Colors.white,
                  child: Dash(
                    width: 3,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
        ),

        // CustomPaint(painter: MyLinePainter()),
        ClipPath(
          clipper: TicketClipperBottom(punchRadius: widget.punchRadius),
          child: Container(
            width: 300,
            child: widget.bottomChild,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
          ),
        ),
      ],
    ));
  }
}

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({this.punchRadius});

  final double punchRadius;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
      Rect.fromCircle(
        center: Offset(0.0, size.height),
        radius: punchRadius,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width, size.height),
        radius: punchRadius,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class TicketClipperBottom extends CustomClipper<Path> {
  TicketClipperBottom({this.punchRadius});

  final double punchRadius;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(
      Rect.fromCircle(
        center: Offset(0.0, 0),
        radius: punchRadius,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width, 0),
        radius: punchRadius,
      ),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class Dash extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  const Dash({this.height = 1, this.width = 3, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
