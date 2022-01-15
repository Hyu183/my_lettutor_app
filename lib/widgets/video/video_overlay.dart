import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoOverlay extends StatefulWidget {
  final VideoPlayerController controller;
  const VideoOverlay({Key? key, required this.controller}) : super(key: key);

  @override
  State<VideoOverlay> createState() => _VideoOverlayState();
}

class _VideoOverlayState extends State<VideoOverlay> {
  late bool isPlaying;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPlaying = widget.controller.value.isPlaying;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        isPlaying
            ? Container()
            : Container(
                color: Colors.black26,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 80,
                ),
              ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: VideoProgressIndicator(
            widget.controller,
            allowScrubbing: true,
          ),
        ),
      ],
    );
  }
}
