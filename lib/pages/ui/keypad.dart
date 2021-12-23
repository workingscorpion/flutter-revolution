import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/constants/customColors.dart';

class KeyPadPage extends StatefulWidget {
  KeyPadPage({Key key}) : super(key: key);

  @override
  _KeyPadPageState createState() => _KeyPadPageState();
}

class _KeyPadPageState extends State<KeyPadPage> {
  List<int> initDigits = List<int>.generate(10, (i) => i)..shuffle();
  String password = "";

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
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.black),
          child: Container(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: () => AppRouter.pop(),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20, right: 25),
                    alignment: Alignment.centerRight,
                    child: Text('Cancel'),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  title() => Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text(
          'Enter PIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );

  subtitle() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Please Enter',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          Text(
            'the 6 digit password.',
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      );

  safeKeyPad() => Expanded(
        child: Column(
          children: [
            digits(),
            Spacer(),
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
        builder: (BuildContext context) => index < length
            ? circle(CustomColors.mainColor)
            : circle(Colors.black),
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
