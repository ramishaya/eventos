import 'package:eventos/core/utils/constants/app_texts.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/features/authentication/presentation/views/register/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(ESizes.defaultSpace),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText.signUpTitle,
                        style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(
                      height: ESizes.spaceBtwSections,
                    ),

                    const RegisterForm(),
                  ])),
        ));
  }
}
