import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customBox.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PinPage extends StatefulWidget {
  PinPage({Key key}) : super(key: key);

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  List<int> initDigits = List<int>.generate(10, (i) => i)..shuffle();
  String password = "";

  showSlide() async {
    await showCupertinoModalBottomSheet(
      topRadius: Radius.circular(30),
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: SingleChildScrollView(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * .9,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () => AppRouter.pop(),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.clear,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 60),
                    child: Column(
                      children: [
                        title(),
                        subtitle(),
                      ],
                    ),
                  ),
                  safeKeyPad(),
                ],
              ),
            ),
          ),
        ),
      ),
      // Container(
      //       constraints: BoxConstraints(
      //         minHeight: MediaQuery.of(context).size.height * .9,
      //       ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 50),
      //             child: Column(
      //               children: [
      //                 title(),
      //                 // subtitle(),
      //               ],
      //             ),
      //           ),
      //           // safeKeyPad(),
      //         ],
      //       ),
      //     ),
      // =============
      // builder: (context) => SingleChildScrollView(
      //   child: Material(
      //     color: Colors.transparent,
      //     child: Container(
      //       constraints: BoxConstraints(
      //         minHeight: MediaQuery.of(context).size.height * .9,
      //       ),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Container(
      //             padding: EdgeInsets.symmetric(horizontal: 50),
      //             child: Column(
      //               children: [
      //                 title(),
      //                 // subtitle(),
      //               ],
      //             ),
      //           ),
      //           // safeKeyPad(),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  int get length {
    return password.length;
  }

  setPassword(int e) {
    password += '$e';
    setState(() {});
    if (length >= 6) {
      AppRouter.pop();
    }
  }

  deletePassword() {
    password = password.substring(0, password.length - 1);
    setState(() {});
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
              title: 'Pin with Slide',
              // title: 'Pin with Blur Slide',
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
                  child: Text('Show Pin Slide'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  title() => Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Text(
          'Enter PIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      );

  subtitle() => Text(
        'Please Enter the 6 digit password.',
        style: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
      );

  safeKeyPad() => Expanded(
        child: Column(
          children: [
            digits(),
            // Spacer(),
            keyPads(),
          ],
        ),
      );

  Widget digits() => Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .22, vertical: 40),
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (i) => digit(i)),
        ),
      );

  Widget keyPads() => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 6 / 4,
          ),
          itemCount: initDigits.length + 2,
          itemBuilder: (BuildContext context, int index) => setKeyPad(index),
        ),
      );

  Widget setKeyPad(int index) {
    if (index == 9) {
      return emptyKeyPad();
    }
    if (index == 10) {
      return keyPad(e: initDigits[index - 1]);
    }
    if (index == 11) {
      return password.length <= 0 ? emptyKeyPad() : keyPad(delete: true);
    }

    return keyPad(e: initDigits[index]);
  }

  Widget emptyKeyPad() => Container(
        height: 50,
        width: 25,
        child: Center(),
      );

  Widget keyPad({int e = 0, bool delete = false}) => GestureDetector(
        onTap: () => !delete && e < 10 ? setPassword(e) : deletePassword(),
        child: Container(
          height: 25,
          width: 25,
          color: Colors.white,
          child: Center(
            child: delete
                ? Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                  )
                : e > 9
                    ? Container()
                    : Text(
                        '$e',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'gmarket',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
          ),
        ),
      );

  Widget digit(int index) => Builder(
        builder: (BuildContext context) =>
            index < length ? circle(Colors.black) : circle(Colors.red),
      );

  Widget circle(Color color) => Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );
}
