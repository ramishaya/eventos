import 'package:eventos/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

//-- dark & light theme for elevated button
class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  //-- light theme

  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.secondaryColor2,
              disabledBackgroundColor: Colors.grey,
              disabledForegroundColor: Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
              textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))));
}
