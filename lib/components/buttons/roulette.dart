import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class RouletteButton extends StatelessWidget {
  const RouletteButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Roulette',
      image: 'assets/home/roulette.png',
      onTap: () => AppRouter.toRoulettePage(),
    );
  }
}
