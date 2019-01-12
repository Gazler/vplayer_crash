import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoAppChewie extends StatefulWidget {
  @override
  _VideoAppChewieState createState() => _VideoAppChewieState();
}

class _VideoAppChewieState extends State<VideoAppChewie> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        _loaded = true;
      });
    });

    _controller = VideoPlayerController.asset('videos/car.mp4')
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            print(_isPlaying);
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chewie Player',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized && _loaded
              ? Chewie(
                  _controller,
                  aspectRatio: _controller.value.aspectRatio,
                  autoPlay: true,
                  looping: true,
                )
              : Container(),
        ),
      ),
    );
  }
}
