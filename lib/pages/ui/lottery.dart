import 'package:flutter/material.dart';
import 'package:revolution/appRouter.dart';
import 'package:revolution/components/customBox.dart';
import 'package:scratcher/scratcher.dart';

class LotteryPage extends StatelessWidget {
  const LotteryPage({Key key}) : super(key: key);

  showLottery() async {
    await showDialog(
      context: AppRouter.context,
      barrierDismissible: false,
      child: Dialog(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
              Future.delayed(Duration(milliseconds: 2000), () {
                print('done');
                AppRouter.pop();
              });
            },

            child: Container(
              width: 200,
              height: 150,
              child: Image.asset('assets/components/lucky.png'),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          children: [
            CustomBox(
                title: 'library Lottery - scratcher',
                child: InkWell(
                  onTap: () => showLottery(),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey,
                    ),
                    child: Text(
                      'Lucky Draw',
                      style: TextStyle(color: Colors.white),
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
