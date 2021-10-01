import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  String time;
  Timer timer;

  @override
  void initState() {
    time = formatting(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) => getTime());
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  getTime() {
    time = formatting(DateTime.now());
    setState(() {});
  }

  formatting(DateTime date) {
    return DateFormat("yyyy/MM/dd hh:mm:ss").format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$time',
      ),
    );
  }
}
