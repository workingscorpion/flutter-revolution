import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class MaskAlertButton extends StatelessWidget {
  const MaskAlertButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Mask Alert',
      image: 'assets/home/maskAlert.png',
      onTap: () => AppRouter.toMaskAlertPage(),
    );
  }
}
