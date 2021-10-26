import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SlideClock extends StatefulWidget {
  SlideClock({Key key}) : super(key: key);

  @override
  _SlideClockState createState() => _SlideClockState();
}

class _SlideClockState extends State<SlideClock> {
  List<String> firstHour = ["0", "0"];
  List<String> lastHour = ["0", "0"];
  List<String> firstMinute = ["0", "0"];
  List<String> lastMinute = ["0", "0"];
  List<String> firstSecond = ["0", "0"];
  List<String> lastSecond = ["0", "0"];

  Timer timer;

  AnimationController controller;
  Animation animation;
  bool running = true;

  @override
  void initState() {
    super.initState();
    setTimer();
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) => setTimer());
  }

  setTimer() {
    final now = DateTime.now();
    final hourSplit =
        "${now.hour < 10 ? '0${now.hour}' : '${now.hour}'}".split("");
    final minuteSplit =
        "${now.minute < 10 ? '0${now.minute}' : '${now.minute}'}".split("");
    final secondSplit =
        "${now.second < 10 ? '0${now.second}' : '${now.second}'}".split("");
    firstHour = firstHour.sublist(1)..add(hourSplit.first);
    lastHour = lastHour.sublist(1)..add(hourSplit.last);
    firstMinute = firstMinute.sublist(1)..add(minuteSplit.first);
    lastMinute = lastMinute.sublist(1)..add(minuteSplit.last);
    firstSecond = firstSecond.sublist(1)..add(secondSplit.first);
    lastSecond = lastSecond.sublist(1)..add(secondSplit.last);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text('${DateFormat("yyyy/MM/dd").format(DateTime.now())}'),
          ),
          clock(),
        ],
      ),
    );
  }

  clock() => Container(
        child: Row(
          children: [
            panels(firstHour, lastHour),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                ':',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            panels(firstMinute, lastMinute),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                ':',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            panels(firstSecond, lastSecond),
          ],
        ),
      );

  panels(List<String> first, List<String> last) => Container(
        child: Row(
          children: [
            panel(first),
            Container(
              width: 5,
            ),
            panel(last),
          ],
        ),
      );

  Widget panel(List<String> value) => Container(
        height: 50,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.black,
        ),
        alignment: Alignment.center,
        child: Text(
          '$value',
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
      );
}
