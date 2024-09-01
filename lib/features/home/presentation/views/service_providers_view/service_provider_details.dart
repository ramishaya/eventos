import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:video_player/video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ServiceProviderSViewDetails extends StatefulWidget {
  const ServiceProviderSViewDetails(
      {super.key, required this.providersDetailsData});
  final ServiceProviderDetails providersDetailsData;

  @override
  State<ServiceProviderSViewDetails> createState() =>
      _ServiceProviderSViewDetailsState();
}

class _ServiceProviderSViewDetailsState
    extends State<ServiceProviderSViewDetails> {
  late PageController _pageController;
  final List<String> _imageUrls = [
    "https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ];

  final List<String> _videoUrls = [
    "assets/images/logos/reel3.mp4",
    "assets/images/logos/reel.mp4",
    "assets/images/logos/reel2.mp4",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> mediaUrls = [..._imageUrls, ..._videoUrls];
    final providerData = widget.providersDetailsData;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          borderRadius: BorderRadius.circular(70),
          onTap: GoRouter.of(context).pop,
          child: const Icon(
            Iconsax.arrow_left_24,
            size: 30,
            color: AppColors.secondaryColor2,
          ),
        ),
        title: const Text('Service Provider Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Media slider
            SizedBox(
              height: HelperFunctions.screenHeight(context) * 0.3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: mediaUrls.length,
                itemBuilder: (context, index) {
                  final url = mediaUrls[index];
                  if (url.contains('unsplash') || url.endsWith('.png')) {
                    return Image.network(
                      url,
                      fit: BoxFit.cover,
                    );
                  } else if (url.contains('reel')) {
                    return VideoPlayerWidget(url: url);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            SizedBox(
              height: HelperFunctions.screenHeight(context) * 0.02,
            ),
            // Dots indicator
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: mediaUrls.length,
                effect: const WormEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  activeDotColor: AppColors.secondaryColor2,
                ),
              ),
            ),
            SizedBox(
              height: HelperFunctions.screenHeight(context) * 0.03,
            ),
            // Title
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: HelperFunctions.screenWidth(context) * 0.03),
              child: Text(
                providerData.name ?? 'No Name',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: HelperFunctions.screenHeight(context) * 0.01,
            ),
            // Location
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: HelperFunctions.screenWidth(context) * 0.03),
              child: Row(
                children: [
                  const Icon(Icons.work, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    providerData.serviceCategory!.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: HelperFunctions.screenWidth(context) * 0.03),
              child: const Text(
                "Info",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Capacity and price
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: HelperFunctions.screenWidth(context) * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Wage: ${providerData.wage ?? 'N/A'}\.sp',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: HelperFunctions.screenWidth(context) * 0.03),
              child: const Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Description
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: HelperFunctions.screenWidth(context) * 0.03),
              child: const Text(
                'No description available for this Service Provider',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  const VideoPlayerWidget({super.key, required this.url});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.url)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        _controller.play();
      }).catchError((error) {
        print("Error initializing video player: $error");
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : const Center(
            child: CircularProgressIndicator(
            color: AppColors.secondaryColor2,
          ));
  }
}
