import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/device/device_utility.dart';
import 'package:eventos/features/authentication/presentation/view_models/onBoarding_cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key, required this.onBoardingCubit,
  });
 final  OnBoardingCubit onBoardingCubit;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: EDeviceUtils.getAppBarBarHeight(),
        right: ESizes.defaultSpace - 10,
        child: TextButton(
          onPressed: () => onBoardingCubit.skip(),
          child: Text(
            'Skip',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
