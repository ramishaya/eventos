import 'package:eventos/core/utils/constants/app_texts.dart';
import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
            height:150,
            image: AssetImage(
                 AssetsData.logo )),
        Text(
          AppText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: ESizes.sm,
        ),
        Text(
          AppText.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
