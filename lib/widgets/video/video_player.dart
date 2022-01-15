import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const MyVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _videoController;
   bool isPlaying =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
            
        });
      })
      ..play();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: () {
        _videoController.value.isPlaying
            ? _videoController.pause()
            : _videoController.play();
        setState(() {
          isPlaying = !isPlaying;
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: _videoController.value.isInitialized
            ? Center(
                child: Stack(children: [
                  VideoPlayer(_videoController),
                
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
                          _videoController,
                          allowScrubbing: true,
                        ),
                      ),
                
                  
                ]),
              )
            : Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey.shade300,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
      ),
    );
  }
}
