import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/ticket.dart';
import 'package:revolution/constants/customColors.dart';

class TicketPage extends StatelessWidget {
  const TicketPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          children: [
            fullTicket(
              borderRadius: 0,
              topChild: topContents(),
              bottomChild: bottomContents(),
            ),
            ticket(),
            stampTicket(),
          ],
        ),
      ),
    );
  }

  topContents() => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '응모 완료',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(height: 5),
            Text(
              '이벤트가 참여 완료되었습니다.',
              style: TextStyle(fontSize: 14),
            ),
            Container(height: 5),
            Text(
              '당첨이 되길 바라요!',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      );

  bottomContents() => Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '내 잔여 응모 기회가',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' n회 ',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.mainColor,
                  ),
                ),
                Text(
                  '남았습니다.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Container(height: 10),
            Container(
              alignment: Alignment.center,
              child: Text(
                '내역 보러가기',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Container(height: 12),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColors.mainColor,
              ),
              alignment: Alignment.center,
              child: Text(
                '확인',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );

  fullTicket({
    double borderRadius,
    Widget topChild,
    Widget bottomChild,
  }) =>
      CustomBox(
        title: 'Full Ticket',
        child: Container(
          decoration: new BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.16),
              blurRadius: 6,
              offset: Offset(0.0, 3.0),
            ),
          ]),
          child: Stack(
            children: [
              ClipPath(
                clipper: FullTicketClipper(punchRadius: 10, top: 200),
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: topChild,
                      ),
                      Dash(
                        width: 3,
                        height: 1,
                        color: Colors.grey[300],
                      ),
                      Expanded(
                        child: bottomChild,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  ticket() => CustomBox(
        title: 'Ticket',
        child: Container(
          decoration: new BoxDecoration(
              // color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.16),
                  blurRadius: 6,
                  offset: Offset(0.0, 3.0),
                ),
              ]),
          child: Ticket(
            borderRadius: 0,
            topChild: topContents(),
            bottomChild: bottomContents(),
          ),
        ),
      );

  stampTicket() => CustomBox(
        title: 'Ticket with Stamp',
        child: Container(
          decoration: new BoxDecoration(
              // color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.16),
                  blurRadius: 6,
                  offset: Offset(0.0, 3.0),
                ),
              ]),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Ticket(
                borderRadius: 0,
                topChild: topContents(),
                bottomChild: bottomContents(),
              ),
              Positioned(
                top: -35,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: CustomColors.mainColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    'assets/components/stamp.svg',
                    color: Colors.white,
                    height: 60,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

class FullTicketClipper extends CustomClipper<Path> {
  FullTicketClipper({this.top, this.punchRadius});

  final double top;
  final double punchRadius;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, top - punchRadius);
    path.conicTo(punchRadius, top - punchRadius, punchRadius, top, 1.0);
    path.conicTo(punchRadius, top + punchRadius, 0, top + punchRadius, 1.0);

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, top + punchRadius);
    path.conicTo(size.width - punchRadius, top + punchRadius,
        size.width - punchRadius, top, 1.0);
    path.conicTo(size.width - punchRadius, top - punchRadius, size.width,
        top - punchRadius, 1.0);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
