import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class ProgressBarButton extends StatelessWidget {
  const ProgressBarButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      image: 'assets/home/progress.png',
      text: 'progress Bar',
      onTap: () => AppRouter.toProgressPage(),
    );
  }
}
