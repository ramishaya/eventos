import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/styles/spacing_styles.dart';
import 'package:eventos/features/authentication/presentation/views/login/widgets/login_form.dart';
import 'package:eventos/features/authentication/presentation/views/login/widgets/login_header.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: ESpacingStyles.paddingWithAppBarHeight(context, 0.03),
          child: const Column(
            children: [
              //Screen Header
              LoginHeader(),

              LoginForm(),

       
              SizedBox(
                height: ESizes.spaceBtwSections,
              ),

       
            ],
          ),
        ),
      ),
    );
  }
}
