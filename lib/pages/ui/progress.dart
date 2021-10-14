import 'package:revolution/components/circularProgress.dart';
import 'package:revolution/components/customBox.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class ProgressPage extends StatefulWidget {
  ProgressPage({Key key}) : super(key: key);

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  int percent = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(), () {
      percent = 52;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            CustomBox(
              child: progressBar(),
              title: 'ProgressBar',
              icon: Icons.bar_chart,
            ),
            CustomBox(
              child: gradientProgressBar(),
              title: 'GradientProgressBar',
              icon: Icons.bar_chart,
            ),
            CustomBox(
              child: circularProgress(),
              title: 'CircularProgress',
              icon: Icons.pie_chart,
            ),
            CustomBox(
              child: gradientCircularProgress(),
              title: 'GradientCircularProgress',
              icon: Icons.pie_chart,
            ),
          ],
        ),
      ),
    );
  }

  Widget progressBar() => Container(
        child: Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
            ),
            AnimatedContainer(
              width:
                  (MediaQuery.of(context).size.width - 50) * (percent * 0.01),
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
          ],
        ),
      );

  Widget gradientProgressBar() => Container(
        child: Stack(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
            ),
            AnimatedContainer(
              width:
                  (MediaQuery.of(context).size.width - 50) * (percent * 0.01),
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.green, Colors.blue],
                ),
              ),
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            ),
          ],
        ),
      );

  circularProgress() => CircularProgress(
        percent: 50.0,
        width: 150,
        height: 150,
        strokeWidth: 10.0,
      );

  gradientCircularProgress() => CircularProgress(
        percent: 80.0,
        width: 150,
        height: 150,
        strokeWidth: 10.0,
        startColor: Colors.green,
        endColor: Colors.blue,
      );
}
