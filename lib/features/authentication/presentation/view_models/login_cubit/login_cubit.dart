import 'package:eventos/features/authentication/data/repos/authentication_repoistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authenticationRepoistory}) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final AuthenticationRepoistory authenticationRepoistory;
  bool isShowingPasssword = true;
  IconData suffix = Iconsax.eye_slash;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showPasswordEye() {
    isShowingPasssword = !isShowingPasssword;
    suffix = isShowingPasssword ? Iconsax.eye_slash : Iconsax.eye;
    emit(ChangePasswordVisibilty());
  }

  Future<void> login() async {
    emit(LoginLoading());
    if (!formKey.currentState!.validate()) {
      emit(WrongValidation());
      return;
    }

    var finalResponse = await authenticationRepoistory.login(
        email: email.text, password: password.text);

    finalResponse.fold(
        (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
        (success) => emit(LoginSuccess(
            sucessMessage:
                "Your are Successfully Loged In \n Welcome back ${success.user!.name}")));
  }
}
