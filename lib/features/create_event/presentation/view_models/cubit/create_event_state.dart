part of 'create_event_cubit.dart';

class CreateEventState extends Equatable {
  const CreateEventState();

  @override
  List<Object> get props => [];
}

class CreateEventInitial extends CreateEventState {}

class CreateEventLoading extends CreateEventState {}

class CreateEventLoaded extends CreateEventState {
  final String sucessMessage;

  const CreateEventLoaded({required this.sucessMessage});
}

class CreateEventFailure extends CreateEventState {
  final String errMessage;

  const CreateEventFailure({required this.errMessage});
}
