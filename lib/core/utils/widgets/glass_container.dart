
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer(
      {super.key,
      required this.size,
      required this.topLeft,
      required this.topRight,
      required this.bottomLeft,
      required this.sigmaX,
      required this.sigmaY,
      this.height,
      this.width,
      required this.bottomRight});

  final Size size;
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;
  final double sigmaX;
  final double sigmaY;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: Container(
          width:width ,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0.1),
              ])),
        ),
      ),
    );
  }
}
