part of 'my_event_cubit.dart';

class MyEventState extends Equatable {
  const MyEventState();

  @override
  List<Object> get props => [];
}

class MyEventInitial extends MyEventState {}

class MyEventLoading extends MyEventState {}

class MyEventLoaded extends MyEventState {
  final MyEventsModel myEventsModel;

  MyEventLoaded({required this.myEventsModel});
}

class MyEventFailure extends MyEventState {
  final String errMessage;

  MyEventFailure({required this.errMessage});
}
