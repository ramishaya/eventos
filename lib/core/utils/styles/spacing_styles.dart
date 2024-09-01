// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:eventos/core/utils/constants/sizes.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';

class ESpacingStyles {
  static EdgeInsetsGeometry paddingWithAppBarHeight(
      BuildContext context, double spcingPersent) {
    return EdgeInsets.only(
        top: ESizes.appBarHeight,
        left: HelperFunctions.screenWidth(context) * spcingPersent,
        right: HelperFunctions.screenHeight(context) * spcingPersent,
        bottom: ESizes.defaultSpace);
  }
}
