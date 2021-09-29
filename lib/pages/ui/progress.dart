import 'package:flutter/material.dart';

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
    print((MediaQuery.of(context).size.width - 50) * (percent * 0.01));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            progressBar(),
            Container(height: 20),
            gradientProgressBar(),
            Container(height: 20),
            circularProgress(),
            Container(height: 20),
            gradientCircularProgress(),
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

  circularProgress() => Container();
  gradientCircularProgress() => Container();
}
