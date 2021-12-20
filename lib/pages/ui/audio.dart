import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AudioCache audioPlayer = AudioCache();
    AudioCache audioPlayer = AudioCache();
    // AudioCache audioPlayer = AudioCache(prefix: '/components/');

    // playLocal() async {
    //   int result =
    //       await audioPlayer.play('/assets/components/audio.mp3', isLocal: true);
    // }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          children: [
            IconButton(
              onPressed: () {
                audioPlayer.play('audio.mp3');
                // playLocal();
              },
              icon: Icon(Icons.play_arrow),
            ),
            IconButton(
              onPressed: () {
                audioPlayer.clearCache();
                // audioPlayer. ('audio.mp3');
                // playLocal();
              },
              icon: Icon(Icons.pause),
            ),
          ],
        ),
      ),
    );
  }
}
