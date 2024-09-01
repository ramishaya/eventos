import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.text,
    required this.onPressFunction,
    required this.textColor,
    required this.fontWeight,
    super.key,
  });
  final String text;
  final Function()? onPressFunction;
  final Color textColor;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressFunction,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: fontWeight),
        ));
  }
}