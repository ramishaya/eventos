part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String successMessage;
  const RegisterSuccess({
    required this.successMessage,
  });

  @override
  List<Object> get props => [successMessage];
}

class RegisterFailure extends RegisterState {
  final String errMessage;
  const RegisterFailure({
    required this.errMessage,
  });

  @override
  List<Object> get props => [errMessage];
}

class PasswordVisibilty extends RegisterState {
  final bool isVisible;

  const PasswordVisibilty({required this.isVisible});

  @override
  List<Object> get props => [isVisible];
}

class CityUpdated extends RegisterState {
  final String city;
  const CityUpdated(this.city);

  @override
  List<Object> get props => [city];
}