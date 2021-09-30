import 'package:btrips/components/circularProgress.dart';
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: StickyHeader(
                header: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(Icons.bar_chart),
                      ),
                      Text('ProgressBar'),
                    ],
                  ),
                ),
                content: progressBar(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: StickyHeader(
                header: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(Icons.bar_chart),
                      ),
                      Text('GradientProgressBar'),
                    ],
                  ),
                ),
                content: gradientProgressBar(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: StickyHeader(
                header: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(Icons.pie_chart),
                      ),
                      Text('CircularProgress'),
                    ],
                  ),
                ),
                content: Center(
                  child: circularProgress(),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.only(bottom: 50),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: StickyHeader(
                header: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(Icons.pie_chart),
                      ),
                      Text('GradientCircularProgress'),
                    ],
                  ),
                ),
                content: Center(
                  child: gradientCircularProgress(),
                ),
              ),
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
