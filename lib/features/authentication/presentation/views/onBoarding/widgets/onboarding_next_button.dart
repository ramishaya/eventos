import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/device/device_utility.dart';
import 'package:eventos/features/authentication/presentation/view_models/onBoarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
    required this.onBoardingCubit,
  });

  final OnBoardingCubit onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    return  Positioned(
              right: ESizes.defaultSpace,
              bottom: EDeviceUtils.getBottomNavigationBarHeight(),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: AppColors.secondaryColor2),
                  onPressed: () {
                    onBoardingCubit.nextPage();
                  },
                  child: const Icon(Iconsax.arrow_right_3))
    );
  }
}
