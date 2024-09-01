import 'package:eventos/core/utils/widgets/custom_sliver_appbar.dart';
import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:eventos/features/home/presentation/view_models/service_providers_cubit/service_providers_cubit.dart';
import 'package:eventos/features/home/presentation/views/home/home.dart';
import 'package:eventos/features/home/presentation/views/home/widgets/service_category_card.dart';
import 'package:eventos/features/home/presentation/views/service_providers_view/widgets/provider_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceProvidersView extends StatelessWidget {
  const ServiceProvidersView({super.key, required this.service});
  final ServiceData service;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CustomSliverAppBar(
            size: size,

            // img: service.image!,
            img:
                "https://images.unsplash.com/photo-1493863641943-9b68992a8d07?q=80&w=2058&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

            title: service.name!,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: SizedBox(
                child:
                    BlocBuilder<ServiceProvidersCubit, ServiceProvidersState>(
                  builder: (context, state) {
                    if (state is ServiceProvidersLoading) {
                      return const CustomLoading();
                    } else if (state is ServiceProvidersLoaded) {
                      return ProviderBuilder(
                          size: size,
                          providersDetailsModel: state.serviceProvidersModel);
                    } else {
                      return const CustomError();
                    }
                  },
                ),
              ),
            )
          ]))
        ],
      ),
    );
  }
}
