import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class VideoButton extends StatelessWidget {
  const VideoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Video',
      image: 'assets/home/video.png',
      onTap: () => AppRouter.toVideoPage(),
    );
  }
}
