import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/constants/gits_sizes.dart';
import 'package:video_player/video_player.dart';

class GitsPlayer extends StatefulWidget {
  const GitsPlayer({super.key, required this.urlVideo});

  final String urlVideo;
  @override
  State<GitsPlayer> createState() => _GitsPlayerState();
}

class _GitsPlayerState extends State<GitsPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.urlVideo)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
        if (!_controller.value.isPlaying)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.black.withOpacity(0.5),
                ],
              ),
            ),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
            ),
          ),
        if (!_controller.value.isPlaying)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                icon: const Icon(
                  Icons.play_circle,
                  color: Colors.white,
                  size: GitsSizes.s40,
                ),
              ),
              const Text(
                "Lihat Cuplikan",
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
      ],
    );
  }
}
