import 'package:eventos/core/utils/constants/app_texts.dart';
import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ForgetPasswordHeader extends StatelessWidget {
  const ForgetPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            width: HelperFunctions.screenWidth(context),
            height: HelperFunctions.screenHeight(context) * 0.18,
            child: Image.asset(
              AssetsData.gif1,
              fit: BoxFit.cover,
            )),
        const SizedBox(
          height: ESizes.spaceBtwItems,
        ),
        Text(
          AppText.resetPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: ESizes.sm,
        ),
        Text(
          AppText.resetPasswordSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
