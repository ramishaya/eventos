import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:go_router/go_router.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard(
      {super.key,
      required this.size,
      required this.providerInfo,
      required this.index});

  final Size size;
  final int index;

  final ServiceProviderDetails providerInfo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kServiceProviderDetails, extra: providerInfo);
      },
      child: Container(
        width: size.width,
        height: size.height * 0.13,
        decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            // color: AppColors.cardColors[index % AppColors.cardColors.length],
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.only(bottom: size.width * 0.05),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 20,
              child: Transform.rotate(
                angle: -math.pi / 7,
                child: Opacity(
                  opacity: 0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/images/logos/techer_image4.jpg",
                        width: size.width * 0.40,
                        height: size.width * 0.40,
),
                  ),
                ),
              ),
            ),
            Positioned(
              right: size.width * 0.03,
              bottom: size.height * 0.01,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  "assets/images/logos/techer_image4.jpg",
                  width: size.width * 0.20,
                  height: size.width * 0.20,
                  
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: size.height * 0.07,
                left: size.width * 0.03,
                child: Text(
                  providerInfo.name!,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                )),
            Positioned(
                bottom: size.height * 0.02,
                left: size.width * 0.03,
                child: Text(
                  "${providerInfo.wage}\.Sp",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
