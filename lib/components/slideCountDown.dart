import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SlideCountDown extends StatefulWidget {
  SlideCountDown({this.endTime, this.duration});

  final DateTime endTime;
  final Duration duration;

  @override
  _SlideCountDownState createState() => _SlideCountDownState();
}

class _SlideCountDownState extends State<SlideCountDown>
    with SingleTickerProviderStateMixin {
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
    setController();
    setTimer();
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) => setTimer());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    controller.removeListener(() {});
    controller.dispose();
    animation.removeListener(() {});
    super.dispose();
  }

  setController() {
    controller = AnimationController(duration: widget.duration, vsync: this)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          running = false;
          setState(() {});
        }
      })
      ..addListener(() {
        running = true;
        setState(() {});
      });

    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ))
      ..addListener(() {
        setState(() {});
      });
  }

  setTimer() {
    final diff = widget.endTime.difference(DateTime.now());
    final hour = diff.inHours - diff.inDays * 24;
    final minute = diff.inMinutes - diff.inHours * 60;
    final second = diff.inSeconds - diff.inMinutes * 60;
    final hourSplit = "${diff.inHours < 10 ? '0$hour' : '$hour'}".split("");
    final minuteSplit =
        "${diff.inMinutes < 10 ? '0$minute' : '$minute'}".split("");
    final secondSplit =
        "${diff.inSeconds < 10 ? '0$second' : '$second'}".split("");
    firstHour = firstHour.sublist(1)..add(hourSplit.first);
    lastHour = lastHour.sublist(1)..add(hourSplit.last);
    firstMinute = firstMinute.sublist(1)..add(minuteSplit.first);
    lastMinute = lastMinute.sublist(1)..add(minuteSplit.last);
    firstSecond = firstSecond.sublist(1)..add(secondSplit.first);
    lastSecond = lastSecond.sublist(1)..add(secondSplit.last);
    setState(() {});
    controller.forward();
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
          mainAxisAlignment: MainAxisAlignment.center,
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

  Widget panel(List<String> values) => Container(
        height: 50,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.black,
        ),
        alignment: Alignment.center,
        child: Stack(
          children: values.first != values.last
              ? [
                  child(
                    value: running ? values.first : values.last,
                    opacity: running
                        ? 1.0 - animation.value == 1.0
                            ? 1.0
                            : 1 - animation.value
                        : 1.0,
                    bottom: 50.0 * (animation.value / 1),
                  ),
                  child(
                    value: values.last,
                    opacity: animation.value,
                    bottom: 50.0 * (animation.value / 1) - 50 != -50
                        ? 50.0 * (animation.value / 1) - 50
                        : 0,
                  ),
                ]
              : [child(value: values.last)],
        ),
      );

  child({String value, double opacity, double bottom}) {
    return Positioned(
      bottom: bottom ?? 0,
      left: 4,
      child: Text(
        '$value',
        style: TextStyle(
          color: Colors.white.withOpacity(opacity ?? 1.0),
          fontSize: 40,
        ),
      ),
    );
  }
}
