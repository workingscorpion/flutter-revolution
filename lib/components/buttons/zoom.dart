import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class ZoomButton extends StatelessWidget {
  const ZoomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Zoom In & Out',
      image: 'assets/home/zoom.png',
      onTap: () => AppRouter.toZoomPage(),
    );
  }
}
