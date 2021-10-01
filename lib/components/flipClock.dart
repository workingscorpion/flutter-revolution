import 'dart:async';
import 'dart:math';

import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/material.dart';

class FlipClock extends StatefulWidget {
  FlipClock({Key key}) : super(key: key);

  @override
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock> {
  int year;
  int month;
  int day;
  int hour;
  int minute;
  int second;
  Timer timer;

  @override
  void initState() {
    getTime();
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) => getTime());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  resetTime() {
    final now = DateTime.now();
    year = now.year;
    month = now.month;
    day = now.day;
    hour = now.hour;
    minute = now.minute;
    second = now.second;
  }

  getTime() {
    final now = DateTime.now();
    if (year != now.year) {
      year = now.year;
    }
    if (month != now.month) {
      month = now.month;
    }
    if (day != now.day) {
      day = now.day;
    }
    if (hour != now.hour) {
      hour = now.hour;
    }
    if (minute != now.minute) {
      minute = now.minute;
    }
    if (second != now.second) {
      second = now.second;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text(year.toString()),
              Text(month.toString()),
              Text(day.toString()),
            ],
          ),
          Row(
            children: [
              // flip(date.hour),
              flip(minute),
              Container(
                margin: EdgeInsets.only(right: 10),
              ),
              // flip(second),
            ],
          ),
        ],
      ),
    );
  }

  flip(int value) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.006)
              ..rotateX(pi / 4),
            alignment: Alignment.topCenter,
            // alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: Align(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: child(),
              ),
            ),
            // child: ClipRect(
            //     child: Align(
            //   alignment: Alignment.topCenter,
            //   heightFactor: 0.5,
            //   child: child(),
            // )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.0),
          ),
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.006)
              ..rotateX(pi / 4),
            alignment: Alignment.topCenter,
            // alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5,
                child: child(),
              ),
            ),
            // child: ClipRect(
            //     child: Align(
            //   alignment: Alignment.bottomCenter,
            //   heightFactor: 0.5,
            //   child: child(),
            // )),
          ),
        ],
      );

  child() => Container(
        height: 50,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black,
        ),
        alignment: Alignment.center,
        child: Text(
          '1',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      );

  // flip(int value) =>

  //     FlipPanel.builder(
  //       itemBuilder: (context, index) {
  //         return Container(
  //           color: Colors.black,
  //           padding: EdgeInsets.symmetric(horizontal: 6.0),
  //           child: Text(
  //             value < 10 ? '0$value' : '$value',
  //             style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 50.0,
  //               color: Colors.white,
  //             ),
  //           ),
  //         );
  //       },
  //       itemsCount: 1,
  //       // startIndex: DateTime.now().second,
  //       period: Duration(milliseconds: 5000),
  //       // loop: -1,
  //       spacing: 0.0,
  //     );

}
