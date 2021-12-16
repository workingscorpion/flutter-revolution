import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/constants/customColors.dart';

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
            CustomBox(
              title: 'LoadingBouncingGrid',
              child: Container(
                height: 100,
                child: LoadingBouncingGrid.square(
                  backgroundColor: CustomColors.mainColor,
                ),
              ),
            ),
            CustomBox(
              title: 'wave',
              child: Container(
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.lineScale,
                  color: CustomColors.mainColor,
                ),
              ),
            ),
            CustomBox(
              title: 'wave2',
              child: Container(
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.lineScalePulseOut,
                  color: CustomColors.mainColor,
                ),
              ),
            ),
            CustomBox(
              title: 'line spin',
              child: Container(
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.lineSpinFadeLoader,
                  color: CustomColors.mainColor,
                ),
              ),
            ),
            CustomBox(
              title: 'ball spin',
              child: Container(
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballSpinFadeLoader,
                  color: CustomColors.mainColor,
                ),
              ),
            ),
            CustomBox(
              title: 'ball rotate',
              child: Container(
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,
                  color: CustomColors.mainColor,
                ),
              ),
            ),
            CustomBox(
              title: 'ball triangle',
              child: Container(
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballTrianglePathColoredFilled,
                  color: CustomColors.mainColor,
                ),
              ),
            ),
            CustomBox(
              title: 'ball pulse',
              child: Container(
                height: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulseSync,
                  color: CustomColors.mainColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
