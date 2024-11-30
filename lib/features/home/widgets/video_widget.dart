import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoWidget extends StatefulWidget {
  final String asset;
  const VideoWidget(this.asset, {super.key});

  @override
  State<VideoWidget> createState() => _VideoStateWidget();
}

class _VideoStateWidget extends State<VideoWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset)..setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      if (mounted) {
        setState(() {});
        _controller.play();
      }
    });
  }

  // Future<void> _initializeVideoPlayer() async {
  //   controller = VideoPlayerController.asset(widget.asset)
  //     ..initialize().then((_) {
  //       setState(() {});
  //       controller.play();
  //     })
  // ..setLooping(true);
  //   ..setLooping(true)
  //   ..setPlaybackSpeed(1);
  // await controller.initialize();

  // if (kIsWeb) {
  //   controller.addListener(() {
  //     if (controller.value.hasError) {
  //       controller.initialize().then((_) {
  //         if (mounted) {
  //           setState(() {
  //             controller.play();
  //           });
  //         }
  //       });
  //     }
  //   });
  // }

  // await controller.play();
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(
                    color: Colors.black,
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
