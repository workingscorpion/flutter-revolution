import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/constants/customColors.dart';

class BlurPin extends StatefulWidget {
  BlurPin({Key key}) : super(key: key);

  @override
  _BlurPinState createState() => _BlurPinState();
}

class _BlurPinState extends State<BlurPin> {
  List<int> initDigits = List<int>.generate(10, (i) => i)..shuffle();
  String password = "";
  String answer = "000000";
  int key = 0;

  int get length {
    return password.length;
  }

  setPassword(int e) {
    password += '$e';
    setState(() {});
    if (length >= 6) {
      if (password == answer) {
        AppRouter.pop();
      } else {
        clear();
        shake();
      }
    }
  }

  shake() {
    key++;
    setState(() {});
  }

  deletePassword() {
    password = password.substring(0, password.length - 1);
    setState(() {});
  }

  clear() {
    password = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * .9,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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

  safeKeyPad() => Column(
        children: [
          digits(),
          // Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * .15,
          ),
          keyPads(),
        ],
      );

  Widget digits() => TweenAnimationBuilder<double>(
        key: Key(key.toString()),
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
        builder: (context, animation, child) => key != 0
            ? Transform.translate(
                offset: Offset(
                  20 *
                      2 *
                      (0.5 -
                          (0.5 - Curves.bounceOut.transform(animation)).abs()),
                  0,
                ),
                child: child,
              )
            : child,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (i) => digit(i)),
          ),
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
    if (index == 10) {
      return logoKeyPad();
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

  Widget logoKeyPad() => Container(
        height: 50,
        width: 25,
        child: Center(
          child: Container(
            height: 25,
            child: Image.asset('assets/logo/logo.png'),
          ),
        ),
      );

  Widget keyPad({int e = 0, bool delete = false}) => GestureDetector(
        onTap: () => !delete && e < 10 ? setPassword(e) : deletePassword(),
        child: Container(
          height: 25,
          width: 25,
          color: Colors.transparent,
          child: Center(
            child: delete
                ? Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.white,
                  )
                : e > 9
                    ? Container()
                    : Text(
                        '$e',
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'gmarket',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
          ),
        ),
      );

  Widget digit(int index) => Builder(
        builder: (BuildContext context) => index < length
            ? circle(
                color: Colors.white,
                marginSize: index >= 6 ? 0 : 20,
              )
            : circle(
                color: CustomColors.disabledGrey,
                marginSize: index >= 5 ? 0 : 20,
              ),
      );

  Widget circle({Color color, double marginSize}) => Container(
        width: 20,
        height: 20,
        margin: EdgeInsets.only(right: marginSize),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );
}
