import 'package:eventos/core/utils/router/app_router.dart';
import 'package:eventos/core/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class Eventos extends StatelessWidget {
  const Eventos({super.key,});
// final Object firstView;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
