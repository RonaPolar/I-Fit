import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


//Video for Local and Online Links
class VidPlayer extends StatefulWidget {
  final String? videoAssetPath;
  final String? videoUrl;

  const VidPlayer({Key? key, this.videoAssetPath, this.videoUrl})
      : super(key: key);

  @override
  State<VidPlayer> createState() => _VidPlayerState();
}

class _VidPlayerState extends State<VidPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();

    if (widget.videoAssetPath != null) {
      _controller = VideoPlayerController.asset(widget.videoAssetPath!)
        ..initialize().then((_) {
          setState(() {
            // Ensure the first frame is shown
          });
        });
    } else if (widget.videoUrl != null) {
      _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!))
        ..initialize().then((_) {
          setState(() {
            // Ensure the first frame is shown
          });
        });
    }

    _controller.addListener(() {
      if (!_controller.value.isPlaying &&
          _controller.value.position >= _controller.value.duration) {
        setState(() {
          _isPlaying = false;
        });
      } else if (_controller.value.isPlaying) {
        setState(() {
          _isPlaying = true;
        });
      }
    });
  }

  void _togglePlayPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _togglePlayPause,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            width: double.maxFinite,
            height: 200,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: FittedBox(
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _isPlaying
                ? const SizedBox.shrink()
                : Center(
                    child: _controller.value.isPlaying
                        ? const SizedBox.shrink()
                        : Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8), // Change to your desired background color
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                                  Icons.play_arrow,
                              color: Colors.white,
                              size: 48.0,
                            ),
                          ),
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

//For Youtube vids links
class YouTubePlayer extends StatefulWidget {
    final String videoId;

  const YouTubePlayer({super.key, required this.videoId});

  @override
  State<YouTubePlayer> createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        onReady: () {
          // Player is ready to play.
        },
      ),
      builder: (context, player) {
        return Column(
          children: <Widget>[
            player,
            // Add additional UI components here if needed.
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}