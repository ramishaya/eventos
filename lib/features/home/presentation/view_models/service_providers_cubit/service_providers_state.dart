part of 'service_providers_cubit.dart';

class ServiceProvidersState extends Equatable {
  const ServiceProvidersState();

  @override
  List<Object> get props => [];
}

class ServiceProvidersInitial extends ServiceProvidersState {}

class ServiceProvidersLoading extends ServiceProvidersState {}

class ServiceProvidersLoaded extends ServiceProvidersState {
  final ServiceProvidersModel serviceProvidersModel;

  const ServiceProvidersLoaded({required this.serviceProvidersModel});
}

class ServiceProvidersFailure extends ServiceProvidersState {
  final String errMessage;

  const ServiceProvidersFailure({required this.errMessage});
}
