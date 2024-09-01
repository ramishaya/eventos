import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.screenWidth(context),
      height: HelperFunctions.screenHeight(context),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Padding(
        padding: const EdgeInsets.all(ESizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: HelperFunctions.screenHeight(context)*0.3,),
            Flexible(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: ESizes.spaceBtwItems,
            ),
            Flexible(
              child: Text(
                subTitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
