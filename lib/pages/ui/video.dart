import 'package:flutter/material.dart';
import 'package:revolution/components/customBox.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController assetController;
  VideoPlayerController networkController;

  @override
  void initState() {
    super.initState();
    assetController = VideoPlayerController.asset('assets/components/video.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    networkController = VideoPlayerController.network(
      'https://workingscorpion.s3.ap-northeast-2.amazonaws.com/revolution/video/video.mp4',
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          children: [
            CustomBox(
              title: 'Asset Video',
              child: AspectRatio(
                aspectRatio: assetController.value.aspectRatio,
                child: VideoPlayer(assetController),
              ),
            ),
            CustomBox(
              title: 'Network Video',
              child: AspectRatio(
                aspectRatio: networkController.value.aspectRatio,
                child: VideoPlayer(networkController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
