import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class LotteryButton extends StatelessWidget {
  const LotteryButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Lottery',
      image: 'assets/home/lottery.png',
      onTap: () => AppRouter.toLotteryPage(),
    );
  }
}
