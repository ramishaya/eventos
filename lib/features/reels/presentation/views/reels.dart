import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:eventos/features/reels/data/models/reels_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsView extends StatefulWidget {
  final ReelsModel reels;

  const ReelsView({super.key, required this.reels});

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  late PageController _pageController;
  int _currentIndex = 0;
  late VideoPlayerController _videoPlayerController;
  bool _isMuted = false;
  bool _showMuteIcon = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _initializeVideoPlayer(0);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _initializeVideoPlayer(int index) {
    _videoPlayerController =
        VideoPlayerController.asset(widget.reels.data![index].video!)
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.setLooping(true);
            _videoPlayerController.play();
          });
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
      _videoPlayerController.dispose();
      _initializeVideoPlayer(index);
    });
  }

  void _pauseVideo() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
    }
  }

  void _playVideo() {
    if (!_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _videoPlayerController.setVolume(_isMuted ? 0 : 1);
      _showMuteIcon = true;
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _showMuteIcon = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        itemCount: widget.reels.data!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: _pauseVideo,
            onLongPressUp: _playVideo,
            onTap: _toggleMute,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (_videoPlayerController.value.isInitialized)
                  VideoPlayer(_videoPlayerController)
                else
                  const Center(child: CircularProgressIndicator()),
                Positioned(
                  bottom: HelperFunctions.screenHeight(context) * 0.13,
                  left: HelperFunctions.screenHeight(context) * 0.03,
                  child: Text(
                    widget.reels.data![index].title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (_showMuteIcon)
                  Center(
                    child: Icon(
                      _isMuted ? Icons.volume_off : Icons.volume_up,
                      color: Colors.white,
                      size: 48,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
