import 'package:btrips/appRouter.dart';
import 'package:btrips/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  const TimerButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Timer',
      image: 'assets/home/flip.png',
      onTap: () => AppRouter.toTimerPage(),
    );
  }
}
