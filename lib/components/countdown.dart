import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  CountDown({
    this.endTime,
    this.showDay,
  });

  final DateTime endTime;
  final bool showDay;

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  Duration diff;
  Timer timer;

  int get day {
    return diff.inDays;
  }

  int get hour {
    return diff.inHours - diff.inDays * 24;
  }

  int get dayHour {
    return diff.inHours;
  }

  int get minute {
    return diff.inMinutes - diff.inHours * 60;
  }

  int get second {
    return diff.inSeconds - diff.inMinutes * 60;
  }

  @override
  void initState() {
    diff = widget.endTime.difference(DateTime.now());
    timer =
        Timer.periodic(Duration(seconds: 1), (Timer timer) => getCountDown());
    super.initState();
  }

  getCountDown() {
    diff = widget.endTime.difference(DateTime.now());
    setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${widget.showDay ? "$day $hour" : "$dayHour"}:$minute:$second',
      ),
    );
  }
}
