// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

class LoginState {
  const LoginState();

  // @override
  // List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  String sucessMessage;
  LoginSuccess({
    required this.sucessMessage,
  });
  
}


class LoginFailure extends LoginState {
  String errMessage;
  LoginFailure({
    required this.errMessage,
  });
}
class WrongValidation extends LoginState {}

class ChangePasswordVisibilty extends LoginState {}
