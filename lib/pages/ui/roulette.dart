import 'package:flutter/material.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/components/roulette.dart';

class RoulettePage extends StatelessWidget {
  const RoulettePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          children: [
            CustomBox(
              title: 'Roulette',
              child: Roulette(),
            ),
          ],
        ),
      ),
    );
  }
}
