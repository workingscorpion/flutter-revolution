import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class PinButton extends StatelessWidget {
  const PinButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Pin(Numpad)',
      image: 'assets/home/pin.png',
      onTap: () => AppRouter.toPinPage(),
    );
  }
}
