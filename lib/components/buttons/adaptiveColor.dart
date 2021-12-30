import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class AdaptiveColorButton extends StatelessWidget {
  const AdaptiveColorButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Adaptive Color',
      image: 'assets/home/chat.png',
      onTap: () => AppRouter.toAdaptiveColorPage(),
    );
  }
}
