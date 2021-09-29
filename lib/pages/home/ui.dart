import 'package:btrips/components/buttons/progressBar.dart';
import 'package:btrips/components/buttons/progressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class UIPage extends StatefulWidget {
  UIPage({Key key}) : super(key: key);

  @override
  _UIPageState createState() => _UIPageState();
}

class _UIPageState extends State<UIPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        children: [
          StickyHeader(
            // overlapHeaders: ,
            header: Container(
              height: 50.0,
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Icon(Icons.design_services),
                  Text('UI'),
                ],
              ),
            ),
            content: ListView(
              shrinkWrap: true,
              children: [
                ProgressBarButton(),
                ProgressIndicatorButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
