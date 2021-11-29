import 'package:flutter/material.dart';
import 'package:revolution/components/customBox.dart';
import 'package:revolution/constants/customColors.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  VideoPage({Key key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController assetController;
  VideoPlayerController networkController;
  YoutubePlayerController youtubePlayerController;
  bool youtubeMute = true;

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
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: 'ITzcZia7fsQ',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: youtubeMute,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void dispose() {
    assetController.dispose();
    networkController.dispose();
    youtubePlayerController.dispose();
    super.dispose();
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
              child: videoController(
                player: VideoPlayer(assetController),
                controller: assetController,
              ),
            ),
            CustomBox(
              title: 'Network Video',
              child: videoController(
                player: VideoPlayer(networkController),
                controller: networkController,
              ),
            ),
            CustomBox(
              title: 'Youtube Video',
              child: youtube(),
            ),
          ],
        ),
      ),
    );
  }

  youtube() => YoutubePlayer(
        controller: youtubePlayerController,
        showVideoProgressIndicator: true,
        progressColors: ProgressBarColors(
          playedColor: CustomColors.mainColor,
          handleColor: CustomColors.mainColor,
          bufferedColor: CustomColors.disabledGrey,
          backgroundColor: CustomColors.slateGrey,
        ),
        progressIndicatorColor: Colors.amber,
        bottomActions: [
          CurrentPosition(),
          SizedBox(width: 5),
          ProgressBar(
            isExpanded: true,
          ),
          SizedBox(width: 5),
          RemainingDuration(),
          mute(),
        ],
        onReady: () => youtubePlayerController.addListener(() {}),
        onEnded: (_) => youtubePlayerController.pause(),
      );

  mute() => GestureDetector(
        onTap: () {
          if (youtubeMute) {
            youtubePlayerController.unMute();
          } else {
            youtubePlayerController.mute();
          }
          youtubeMute = !youtubeMute;
          setState(() {});
          print(youtubeMute);
        },
        child: Icon(
          youtubeMute ? Icons.volume_up_rounded : Icons.volume_mute_rounded,
          color: Colors.white,
        ),
      );

  videoController({Widget player, VideoPlayerController controller}) =>
      AspectRatio(
        aspectRatio: assetController.value.aspectRatio,
        child: Stack(
          children: [
            player,
            Opacity(
              opacity: 1,
              child: GestureDetector(
                onTap: () async {
                  print(controller.value.isPlaying);
                  controller.value.isPlaying
                      ? await controller.pause()
                      : await controller.play();
                  print(controller.value.isPlaying);
                  setState(() {});
                },
                child: Container(
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
