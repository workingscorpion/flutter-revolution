import 'package:flutter/material.dart';

class HeroPage extends StatelessWidget {
  const HeroPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'heroButton',
          child: Image.asset('assets/home/hero.png'),
        ),
      ),
    );
  }
}
