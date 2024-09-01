import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:eventos/core/utils/constants/app_texts.dart';
import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:eventos/core/utils/validator/validator.dart';
import 'package:eventos/features/authentication/presentation/view_models/image_picker_cubit/imagepicker_cubit.dart';
import 'package:eventos/features/authentication/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:eventos/features/authentication/presentation/views/register/widgets/register_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kNavigationMenu);
        }
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: AppColors.secondaryColor2,
                content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: RegisterCubit.get(context).registerFormKey,
          child: BlocBuilder<ImagepickerCubit, ImagePickerState>(
            builder: (context, imageState) {
              return Column(
                children: [
                  // Image picker widget
                  GestureDetector(
                    onTap: () =>
                        BlocProvider.of<ImagepickerCubit>(context).pickImage(),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          radius: 64.0,
                          backgroundColor: Colors.blue,
                          backgroundImage: imageState is ImagePickerSuccess
                              ? FileImage(imageState.image)
                              : const AssetImage(AssetsData.logo)
                                  as ImageProvider<Object>,
                        ),
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.primaryColor,
                          child:
                              Icon(Icons.edit, size: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // form fields
                  const SizedBox(height: ESizes.spaceBtwInputField),
                  TextFormField(
                    controller: RegisterCubit.get(context).nameController,
                    decoration: const InputDecoration(
                      label: Text(AppText.userName),
                      prefixIcon: Icon(Iconsax.user_edit),
                    ),
                    validator: (value) =>
                        EValidator.validateEmptyText("User Name", value),
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputField),
                  TextFormField(
                    controller: RegisterCubit.get(context).emailController,
                    decoration: const InputDecoration(
                      label: Text(AppText.email),
                      prefixIcon: Icon(Iconsax.user),
                    ),
                    validator: (value) => EValidator.validateEmail(value),
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputField),
                  TextFormField(
                    controller: RegisterCubit.get(context).passwordController,
                    decoration: InputDecoration(
                      label: const Text(AppText.password),
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        onPressed: () =>
                            RegisterCubit.get(context).showPasswordEye(),
                        icon: RegisterCubit.get(context).isPasswordVisible
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye),
                      ),
                    ),
                    obscureText: RegisterCubit.get(context).isPasswordVisible,
                    validator: (value) => EValidator.validatePassword(value),
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputField),
                  CustomDatePicker(
                    dateController: RegisterCubit.get(context).dateController,
                  ),
                  const SizedBox(height: ESizes.spaceBtwInputField),
                  // city drop down list
                  DropdownButtonFormField<String>(
                    value: RegisterCubit.get(context).selectedCity,
                    decoration: const InputDecoration(
                      label: Text('Governorate'),
                      prefixIcon: Icon(Iconsax.map),
                    ),
                    items: RegisterCubit.get(context)
                        .syrianGovernorates
                        .map((String governorate) {
                      return DropdownMenuItem<String>(
                        value: governorate,
                        child: Text(governorate),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        RegisterCubit.get(context).updateCity(newValue);
                      }
                    },
                    validator: (value) =>
                        EValidator.validateEmptyText("Governorate", value),
                  ),
                  const SizedBox(height: ESizes.spaceBtwSections),
                  ConditionalBuilder(
                    condition: state is! RegisterLoading,
                    builder: (context) => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (imageState is ImagePickerSuccess) {
                            RegisterCubit.get(context)
                                .register(profileImage: imageState.image);
                          } else {
                            RegisterCubit.get(context)
                                .register(profileImage: File(""));
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please select an image')),
                            );
                          }
                        },
                        child: const Text(AppText.createAccount),
                      ),
                    ),
                    fallback: (context) => const CircularProgressIndicator(
                        color: AppColors.secondaryColor2),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
