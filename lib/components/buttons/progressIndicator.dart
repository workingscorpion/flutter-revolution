import 'package:btrips/appRouter.dart';
import 'package:btrips/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorButton extends StatelessWidget {
  const ProgressIndicatorButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      image: 'assets/home/progress-indicator.png',
      text: 'progress Indicator',
      onTap: () => AppRouter.toProgressIndicatorPage(),
    );
  }
}
