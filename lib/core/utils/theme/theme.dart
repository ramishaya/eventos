import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/theme/custom_themes/appbar_theme.dart';
import 'package:eventos/core/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:eventos/core/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:eventos/core/utils/theme/custom_themes/text_field_theme.dart';
import 'package:eventos/core/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: AppColors.darkPrimaryColor.withOpacity(0.15),
        statusBarIconBrightness: Brightness.light));

    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: AppColors.secondaryColor2,
      scaffoldBackgroundColor: Colors.white,
      textTheme: AppTextTheme.lightTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
      appBarTheme: RAppBarTheme.lightAppBarTheme,
      outlinedButtonTheme: AppOutLinedButtonTheme.lightOutLinedButtonTheme,
      inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    );
  }
}
