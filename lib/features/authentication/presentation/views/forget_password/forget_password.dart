import 'package:eventos/core/utils/constants/app_texts.dart';
import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:eventos/core/utils/styles/spacing_styles.dart';
import 'package:eventos/core/utils/validator/validator.dart';
import 'package:eventos/features/authentication/presentation/views/forget_password/widgets/forget_password_header.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ESpacingStyles.paddingWithAppBarHeight(context, 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ForgetPasswordHeader(),
            const SizedBox(
              height: ESizes.spaceBtwSections,
            ),
            Form(
                //key
                child: Center(
              child: Column(
                children: [
                  TextFormField(
                    //controller: RegisterCubit.get(context).emailController,
                    decoration: const InputDecoration(
                      label: Text(AppText.email),
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) => EValidator.validateEmail(value),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
