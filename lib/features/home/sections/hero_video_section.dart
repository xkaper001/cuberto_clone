import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HeroVideoSection extends StatefulWidget {
  const HeroVideoSection({super.key});

  @override
  State<HeroVideoSection> createState() => _HeroVideoSectionState();
}

class _HeroVideoSectionState extends State<HeroVideoSection> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayerFuture = _initializeVideoPlayer();
  }

  Future<void> _initializeVideoPlayer() async {
    _controller = VideoPlayerController.asset('assets/videos/hero.mp4')
      ..setLooping(true)
      ..setPlaybackSpeed(1);
    await _controller.initialize();
    if (mounted) {
      setState(() {
        _controller.play();
      });
    }
    if (kIsWeb) {
      _controller.addListener(() {
        if (_controller.value.hasError) {
          _controller.initialize().then((_) {
            if (mounted) {
              setState(() {
                _controller.play();
              });
            }
          });
        }
      });
    }

  }

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
            return Container();
          }
        });
  }
}
