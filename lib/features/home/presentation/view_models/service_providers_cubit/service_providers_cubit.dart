import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:eventos/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_providers_state.dart';

class ServiceProvidersCubit extends Cubit<ServiceProvidersState> {
  ServiceProvidersCubit({required this.homeRepo})
      : super(ServiceProvidersInitial());
  final HomeRepo homeRepo;
  Future<void> fetchServiceProviders(int id) async {
    emit(ServiceProvidersLoading());
    final finalResponse = await homeRepo.fetchServiceProviders(id);
    finalResponse.fold(
        (failure) =>
            emit(ServiceProvidersFailure(errMessage: failure.errMessage)),
        (success) =>
            emit(ServiceProvidersLoaded(serviceProvidersModel: success)));
  }
}
