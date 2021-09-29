import 'package:flutter/material.dart';

class ProgressIndicatorPage extends StatefulWidget {
  ProgressIndicatorPage({Key key}) : super(key: key);

  @override
  _ProgressIndicatorPageState createState() => _ProgressIndicatorPageState();
}

class _ProgressIndicatorPageState extends State<ProgressIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            progressBar(),
            circularProgress(),
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
            FractionallySizedBox(
              widthFactor: .52,
              child: Container(
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      );

  circularProgress() => Container();
}
