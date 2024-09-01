import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: EDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: ESizes.defaultSpace,
        child: SmoothPageIndicator(
            effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.light, dotHeight: 6),
            controller: pageController,
            count: 3));
  }
}
