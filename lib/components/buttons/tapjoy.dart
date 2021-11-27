import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class TapjoyButton extends StatelessWidget {
  const TapjoyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Tapjoy',
      image: 'assets/home/tapjoy.png',
      onTap: () => AppRouter.toTapjoyPage(),
    );
  }
}
