import 'package:flutter/material.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/lottery.dart';
import 'package:scratcher/scratcher.dart';

class LotteryPage extends StatelessWidget {
  const LotteryPage({Key key}) : super(key: key);

  // showAlert() async {
  //   await showDialog(context: null)
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          children: [
            CustomBox(
                title: 'library Lottery - scratcher',
                child: Scratcher(
                  threshold: 50,
                  brushSize: 30,
                  color: Colors.grey,
                  onChange: (double value) async {
                    if (value > 50.0) {
                      // await showAlert();
                      print('Congraturation');
                    }
                  },
                  onThreshold: () {},
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Image.asset('assets/home/lottery.png'),
                  ),
                )),
            CustomBox(
              title: 'Basic Lottery',
              child: Lottery(
                value: '20',
              ),
            ),
            CustomBox(
              title: 'Image Lottery',
              child: Lottery(
                  // value: '20',
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
