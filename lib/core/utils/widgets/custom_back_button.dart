
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CustomBackButton2 extends StatelessWidget {
  const CustomBackButton2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    focusColor: Colors.transparent,
    borderRadius: BorderRadius.circular(70),
    onTap: GoRouter.of(context).pop,
    child: const Icon(
      Iconsax.arrow_left_24,
      size: 30,
      color: AppColors.white,
    ),
          );
  }
}
