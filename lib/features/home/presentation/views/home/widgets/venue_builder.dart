import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/features/home/data/models/venue_model.dart';
import 'package:eventos/features/home/presentation/views/home/home.dart';
import 'package:eventos/features/home/presentation/view_models/venue_cubit/venue_cubit.dart';
import 'package:eventos/features/home/presentation/views/home/widgets/venue_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenueBuilder extends StatelessWidget {
  const VenueBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VenueCubit, VenueState>(
      builder: (context, state) {
        if (state is VenueStateLoading) {
          return const CustomLoading();
        } else if (state is VenueStateLoaded) {
          return Column(
            children: List.generate(state.venueModel.data!.length, (index) {
              return VenueCard(
                index: index,
                venueModel: state.venueModel,
              );
            }),
          );
        } else {
          return const CustomError();
        }
      },
    );
  }
}
