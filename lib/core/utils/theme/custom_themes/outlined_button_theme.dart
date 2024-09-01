
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppOutLinedButtonTheme {
  AppOutLinedButtonTheme._();
  static final lightOutLinedButtonTheme = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          side: const BorderSide(color: AppColors.secondaryColor2),
          textStyle: const TextStyle(
              fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))));
}
