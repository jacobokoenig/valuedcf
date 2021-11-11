import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerView> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(
        'https://firebasestorage.googleapis.com/v0/b/the-nice-place-7a50b.appspot.com/o/Value%20DCF%20explainer.mp4?alt=media&token=25822db3-ff3e-4be5-8691-32a187488dd4')
      ..initialize().then((_) {
        setState(() {
          _videoController.pause();
        });
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoController.value.isInitialized
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: Stack(
                children: [
                  GestureDetector(
                      onTap: () async {
                        await _videoController.pause();
                        await _videoController.seekTo(Duration.zero);
                        this.setState(() {});
                      },
                      child: VideoPlayer(_videoController)),
                  GestureDetector(
                    onTap: () {
                      _videoController.play();
                      this.setState(() {});
                    },
                    child: Visibility(
                      visible: !_videoController.value.isPlaying,
                      child: Container(
                        color: Colors.black26,
                        child: Center(
                          child: Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Icon(Icons.play_arrow),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
