import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:eventos/features/home/presentation/views/service_providers_view/widgets/provider_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProviderBuilder extends StatelessWidget {
  const ProviderBuilder(
      {super.key, required this.size, required this.providersDetailsModel});

  final ServiceProvidersModel providersDetailsModel;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: providersDetailsModel.data!.length,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
                duration: const Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                horizontalOffset: 30,
                verticalOffset: 300.0,
                child: FlipAnimation(
                    duration: const Duration(milliseconds: 3000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    flipAxis: FlipAxis.y,
                    child: ProviderCard(
                      size: size,
                      providerInfo: providersDetailsModel.data![index],
                      index: index,
                    ))));
      },
    ));
  }
}
