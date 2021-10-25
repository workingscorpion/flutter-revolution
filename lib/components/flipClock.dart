import 'dart:async';
import 'dart:math' as math;

import 'package:flip_panel/flip_panel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlipClock extends StatefulWidget {
  FlipClock({Key key}) : super(key: key);

  @override
  _FlipClockState createState() => _FlipClockState();
}

class _FlipClockState extends State<FlipClock>
    with SingleTickerProviderStateMixin {
  List<String> firstHour = ["0", "0"];
  List<String> lastHour = ["0", "0"];
  List<String> firstMinute = ["0", "0"];
  List<String> lastMinute = ["0", "0"];
  List<String> firstSecond = ["0", "0"];
  List<String> lastSecond = ["0", "0"];
  Timer timer;

  AnimationController controller;
  Animation topAnimation;
  Animation bottomAnimation;
  bool running = true;

  @override
  void initState() {
    setController();
    getTime();
    timer = Timer.periodic(
      Duration(milliseconds: 1000),
      (Timer timer) => getTime(),
    );

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    topAnimation.removeListener(() {});
    bottomAnimation.removeListener(() {});
    controller.removeListener(() {});
    controller.dispose();
    super.dispose();
  }

  setController() {
    controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reset();
            }
            if (status == AnimationStatus.dismissed) {
              // _currentValue = _nextValue;
              running = false;
            }
          })
          ..addListener(() {
            setState(() {
              running = true;
            });
          });
    topAnimation = Tween(begin: 0.0, end: 1.5).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.5),
    ))
      ..addListener(() {
        setState(() {});
      });

    bottomAnimation = Tween(begin: 1.5, end: 0.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.5, 1.0),
    ))
      ..addListener(() {
        setState(() {});
      });
  }

  resetTime() {
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

  getTime() {
    resetTime();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text('${DateFormat("yyyy/MM/dd").format(DateTime.now())}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              flips(firstHour, lastHour),
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
              flips(firstMinute, lastMinute),
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
              flips(firstSecond, lastSecond),
            ],
          ),
        ],
      ),
    );
  }

  flips(List<String> first, List<String> last) => Container(
        child: Row(
          children: [
            flip(first),
            Container(
              width: 5,
            ),
            flip(last),
          ],
        ),
      );

  Widget flip(List<String> value) => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topFlip(value),
          bottomFlip(value),
        ],
      );

  topFlip(List<String> value) => Stack(
        children: [
          topChild(value.last),
          value.first != value.last
              ? Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateX(topAnimation.value),
                  alignment: Alignment.bottomCenter,
                  child: topChild(value.last),
                  // child: topChild((int.parse(value.last) + 1).toString()),
                )
              : Container(),
        ],
      );

  bottomFlip(List<String> value) => Stack(
        children: [
          bottomChild(value.last),
          value.first != value.last
              ? Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.003)
                    ..rotateX(bottomAnimation.value),
                  alignment: Alignment.topCenter,
                  child: bottomChild(value.last),
                  // child: bottomChild((int.parse(value.last) + 1).toString()),
                )
              : Container(),
        ],
      );

  topChild(String value) => ClipRect(
        child: Align(
          alignment: Alignment.topCenter,
          heightFactor: 0.5,
          child: child(value),
        ),
      );

  bottomChild(String value) => ClipRect(
        child: Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.5,
          child: child(value),
        ),
      );

  child(String value) => Container(
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
