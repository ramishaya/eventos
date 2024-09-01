import 'package:eventos/core/utils/dependency_management/service_locator.dart';
import 'package:eventos/core/utils/local_storage/local_storage.dart';

import 'package:eventos/eventos.dart';
import 'package:eventos/features/create_event/data/repos/create_event_repo_impl.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await LocalStorage.init();

  getIt.get<CreateEventRepoImpl>().myEvent();

  runApp(const Eventos());
}
