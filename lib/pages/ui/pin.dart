import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/blurPin.dart';
import 'package:revolution/components/customBox.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:revolution/constants/customColors.dart';

class PinPage extends StatefulWidget {
  PinPage({Key key}) : super(key: key);

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  showSlide() async {
    await showCupertinoModalBottomSheet(
      topRadius: Radius.circular(30),
      backgroundColor: Colors.black.withOpacity(.45),
      context: context,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Material(
          color: Colors.transparent,
          child: BlurPin(),
        ),
      ),
    );
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
              title: 'Whole Page Pin Pad',
              child: InkWell(
                onTap: () => AppRouter.toKeyPadPage(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Go to Pin Pad Page'),
                ),
              ),
            ),
            CustomBox(
              title: 'Pin with Blur Slide',
              child: InkWell(
                onTap: () => showSlide(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text('Show Pin Blur Slide'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
