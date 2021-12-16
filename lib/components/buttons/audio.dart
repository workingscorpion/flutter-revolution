import 'package:revolution/appRouter.dart';
import 'package:revolution/components/buttons/customButton.dart';
import 'package:flutter/material.dart';

class AudioButton extends StatelessWidget {
  const AudioButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Audio',
      image: 'assets/home/audio.png',
      onTap: () => AppRouter.toAudioPage(),
    );
  }
}
