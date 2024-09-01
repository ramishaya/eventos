part of 'send_code_cubit.dart';

class SendCodeState extends Equatable {
  const SendCodeState();

  @override
  List<Object> get props => [];
}

class SendCodeInitial extends SendCodeState {}

class SendCodeLoaded extends SendCodeState {
  final String message;

  const SendCodeLoaded({required this.message});
}
class SendCodeLoading extends SendCodeState {}
