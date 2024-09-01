import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:eventos/core/utils/widgets/custom_back_button.dart';
import 'package:eventos/features/home/data/models/venue_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VenueDetails extends StatelessWidget {
  const VenueDetails({super.key, required this.venueDetails});
  final Data venueDetails;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return Scaffold(
      appBar: AppBar(
        leading:  InkWell(
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
        title: const Text('Venue Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image slider
            SizedBox(
              height: HelperFunctions.screenHeight(context) * 0.3,
              child: PageView.builder(
                controller: pageController,
                itemCount: 5, // Number of images
                itemBuilder: (context, index) {
                  return Image.network(
                    "https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    // Replace with your image paths
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(
              height: HelperFunctions.screenHeight(context) * 0.02,
            ),
            // Dots indicator
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 5, // Number of images
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
                venueDetails.name!,
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
                  const Icon(Icons.location_on, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    venueDetails.location!,
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
                    'Capacity: ${venueDetails.capacity}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'price:${venueDetails.price}sp',
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
              child: Text(
                venueDetails.description!,
                style: const TextStyle(
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
