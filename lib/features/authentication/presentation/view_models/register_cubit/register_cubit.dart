import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:eventos/features/authentication/data/repos/authentication_repoistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authenticationRepoistory})
      : super(RegisterInitial());

  final AuthenticationRepoistory authenticationRepoistory;

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;
  String? selectedCity;
  final List<String> syrianGovernorates = [
    'Damascus',
    'Aleppo',
    'Homs',
    'Latakia',
    'Hama',
    'Daraa',
    'Raqqa',
    'Deir ez-Zor',
    'Idlib',
    'Tartus',
    'Quneitra',
    'Hasakah',
    'As-Suwayda'
  ];

  void updateCity(String city) {
    selectedCity = city;
    emit(CityUpdated(city));
  }

  Future<void> register({required File profileImage}) async {
    if (selectedCity == null) {
      emit(const RegisterFailure(errMessage: "Please select a governorate"));
      return;
    }
    if (!registerFormKey.currentState!.validate()) {
      emit(const RegisterFailure(errMessage: "please input a valid forms"));
      return;
    }
    emit(RegisterLoading());
    var finalResponse = await authenticationRepoistory.register(
      birthDate: dateController.text,
      email: emailController.text,
      governorate: selectedCity!,
      password: passwordController.text,
      name: nameController.text,
      profileImage: profileImage,
    );
    finalResponse.fold(
        (failure) => emit(RegisterFailure(errMessage: failure.errMessage)),
        (success) => emit(RegisterSuccess(
            successMessage:
                "You are Registered successfully ${success.user!.name}")));
  }

  void showPasswordEye() {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilty(isVisible: isPasswordVisible));
  }
}
