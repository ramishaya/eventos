import 'package:card_swiper/card_swiper.dart';
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:eventos/features/home/presentation/views/home/widgets/service_category_card.dart';
import 'package:flutter/material.dart';

class ServiceProvidersBuilder extends StatelessWidget {
  const ServiceProvidersBuilder({
    super.key,
    required this.size,
    required this.serviveProviders,
  });

  final Size size;
  final ServiceModel serviveProviders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.39,
      child: Swiper(
        itemCount: serviveProviders.data!.length,
        itemWidth: double.infinity,
        layout: SwiperLayout.DEFAULT,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: AppColors.grey,
                activeColor: AppColors.secondaryColor2,
                activeSize: 13,
                space: 4)),
        itemBuilder: (context, index) {
          return Column(
            children: [
              ServiceProvidersCard(
                  size: size, serviceProviders: serviveProviders, index: index),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          );
        },
      ),
    );
  }
}
