import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorButton extends StatelessWidget {
  const ProgressIndicatorButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      image: 'assets/home/progress-indicator.png',
      text: 'Loading Indicator',
      onTap: () => AppRouter.toProgressIndicatorPage(),
    );
  }
}
