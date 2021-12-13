import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class HeroButton extends StatelessWidget {
  const HeroButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'heroButton',
      child: Material(
        child: CustomButton(
          text: 'Hero',
          image: 'assets/home/hero.png',
          onTap: () => AppRouter.toHeroPage(),
        ),
      ),
    );
  }
}
