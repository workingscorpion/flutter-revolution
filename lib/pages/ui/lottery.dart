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
                child: SingleChildScrollView(
                  child: Scratcher(
                    threshold: 50,
                    brushSize: 30,
                    color: Colors.grey,
                    // image: Image.asset('assets/home/roulette.png'),
                    // onChange: (double value) async {
                    //   if (value > 50.0) {
                    //     // await showAlert();
                    //   }
                    // },
                    onThreshold: () {
                      print('Congraturation');
                    },
                    child: Container(
                      width: 200,
                      height: 150,
                      child: Image.asset('assets/home/lottery.png'),
                    ),
                  ),
                )),
            // CustomBox(
            //   title: 'Basic Lottery',
            //   child: Lottery(
            //     value: 'You won \$20',
            //   ),
            // ),
            // CustomBox(
            //   title: 'Image Lottery',
            //   child: Lottery(),
            // ),
          ],
        ),
      ),
    );
  }
}
