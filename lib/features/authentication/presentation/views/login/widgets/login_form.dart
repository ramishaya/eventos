import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventos/core/utils/constants/app_texts.dart';
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:eventos/core/utils/validator/validator.dart';
import 'package:eventos/core/utils/widgets/loading/loading_item.dart';
import 'package:eventos/features/authentication/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          SnackBar(
              content: Container(
            color: AppColors.secondaryColor2,
            child: Center(
                child: Text(
              state.sucessMessage,
              style: const TextStyle(color: Colors.red),
            )),
          ));
          GoRouter.of(context).pushReplacement(AppRouter.kNavigationMenu);
        }
        if (state is LoginFailure) {
          SnackBar(
              content: Container(
            color: AppColors.secondaryColor2,
            child: Center(
                child: Text(
              state.errMessage,
              style: const TextStyle(color: Colors.red),
            )),
          ));
        }
        if (state is WrongValidation) {
          SnackBar(
              content: Container(
            color: AppColors.secondaryColor2,
            child: const Center(
                child: Text(
              "wrong validation",
              style: TextStyle(color: Colors.yellowAccent),
            )),
          ));
        }
      },
      builder: (context, state) {
        return Form(
            key: LoginCubit.get(context).formKey,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: ESizes.spaceBtwSections),
              child: Column(
                children: [
                  TextFormField(
                    controller: LoginCubit.get(context).email,
                    validator: (value) => EValidator.validateEmail(value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: AppText.email),
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputField),
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) => TextFormField(
                      controller: LoginCubit.get(context).password,
                      expands: false,
                      decoration: InputDecoration(
                        label: const Text(AppText.password),
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () =>
                                LoginCubit.get(context).showPasswordEye(),
                            icon: Icon(LoginCubit.get(context).suffix)),
                      ),
                      obscureText: LoginCubit.get(context).isShowingPasssword,
                      validator: (value) => EValidator.validatePassword(value),
                    ),
                  ),

                  const SizedBox(height: (ESizes.spaceBtwInputField) / 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () => 

                          GoRouter.of(context).push(AppRouter.kForgetPasswordView),
                          child: Text(
                            AppText.forgetPassword,
                            style: Theme.of(context).textTheme.bodySmall,
                          ))
                    ],
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),

                  ///Sign In Button
                  ConditionalBuilder(
                      condition: state is! LoginLoading,
                      builder: (context) => SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () => LoginCubit.get(context).login(),
                              child: const Text(AppText.signIn))),
                      fallback: (context) => const SizedBox(
                        height:60,
                        width: 60,
                        child: LoadingItem())),
                  const SizedBox(
                    height: ESizes.spaceBtwItems,
                  ),

                  ///Create Account In Button
                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: () {
                            GoRouter.of(context).push(AppRouter.kRegisterView);
                          },
                          child: const Text(AppText.createAccount))),
                  const SizedBox(
                    height: ESizes.spaceBtwSections,
                  ),
                ],
              ),
            ));
      },
    );
  }
}
