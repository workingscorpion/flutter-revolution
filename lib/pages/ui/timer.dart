import 'package:revolution/components/countdown.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/clock.dart';
import 'package:revolution/components/flipClock.dart';
import 'package:flutter/material.dart';
import 'package:revolution/components/slideClock.dart';
import 'package:revolution/components/slideCountDown.dart';

class TimerPage extends StatefulWidget {
  TimerPage({Key key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            CustomBox(
              child: Clock(),
              title: 'Timer',
              icon: Icons.access_time,
            ),
            CustomBox(
              child: CountDown(
                endTime: DateTime.now().add(Duration(days: 3)),
                showDay: false,
              ),
              title: 'CountDown',
              icon: Icons.timer,
            ),
            // CustomBox(
            //   child: FlipClock(),
            //   title: 'Flip Clock',
            //   icon: Icons.timer,
            // ),
            // CustomBox(
            //   child: FlipClock(
            //     endTime: DateTime.now().add(Duration(hours: 2)),
            //   ),
            //   title: 'Flip CountDown',
            //   icon: Icons.timer,
            // ),
            CustomBox(
              child: SlideClock(
                duration: Duration(milliseconds: 600),
              ),
              title: 'Slide Click',
              icon: Icons.timer,
            ),
            CustomBox(
              child: SlideCountDown(
                endTime: DateTime.now().add(Duration(hours: 2)),
              ),
              title: 'Slide CountDown',
              icon: Icons.timer,
            ),
          ],
        ),
      ),
    );
  }
}
