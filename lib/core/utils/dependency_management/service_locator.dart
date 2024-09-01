import 'package:dio/dio.dart';
import 'package:eventos/core/utils/api_services/api_services.dart';
import 'package:eventos/core/utils/local_storage/local_storage.dart';
import 'package:eventos/features/authentication/data/repos/authentication_repoistory_impl.dart';
import 'package:eventos/features/create_event/data/repos/create_event_repo_impl.dart';
import 'package:eventos/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<LocalStorage>(LocalStorage());

  getIt.registerSingleton<AuthenticationRepoistoryImpl>(
      AuthenticationRepoistoryImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<HomeRepoImpl>(
      HomeRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<CreateEventRepoImpl>(
      CreateEventRepoImpl(apiService: getIt.get<ApiService>()));
}
