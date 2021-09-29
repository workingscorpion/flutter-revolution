import 'package:btrips/appRouter.dart';
import 'package:btrips/constants/customButton.dart';
import 'package:flutter/material.dart';

class ProgressBarButton extends StatelessWidget {
  const ProgressBarButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      image: 'assets/home/progress.png',
      text: 'progress-bar',
      onTap: () => AppRouter.toProgressPage(),
    );
  }
}
