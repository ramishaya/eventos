import 'dart:async';

import 'package:eventos/core/utils/local_storage/local_storage.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:flutter/material.dart';

Future<Widget?> screenRedirect() async {
  LocalStorage.saveDataIfNull(key: "isFirstTime", value: "true");
  if (LocalStorage.getData(key: "isFirstTime") == "true") {
     return    await AppRouter.router.pushReplacement(AppRouter.kOnBoardingView);
  } else {
    return  await  AppRouter.router.pushReplacement(AppRouter.kLoginView);
  }
}
