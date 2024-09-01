
import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/core/utils/helpers/helper_functions.dart';
import 'package:eventos/core/utils/widgets/loading/loading_item.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:eventos/features/home/presentation/view_models/events_category_cubit/events_category_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/service_categories_cubit/service_categories_cubit.dart';
import 'package:eventos/features/home/presentation/views/home/widgets/category_builder.dart';
import 'package:eventos/features/home/presentation/views/home/widgets/home_header.dart';
import 'package:eventos/features/home/presentation/views/home/widgets/service_category_builder.dart';
import 'package:eventos/features/home/presentation/views/home/widgets/venue_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: HelperFunctions.screenWidth(context) * 0.04,
            vertical: HelperFunctions.screenHeight(context) * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(size: size, userName: "Touqa"),
            SizedBox(
              height: size.height * 0.035,
            ),
            BlocBuilder<EventsCategoryCubit, EventsCategoryState>(
              builder: (context, state) {
                if (state is EventsCategoryLoading) {
                  return const CustomLoading();
                } else if (state is EventsCategoryLoaded) {
                  final categoriesList = state.categoryModel.data;
                  return CategoryBuilder(
                      size: size, categoriesList: categoriesList!);
                } else {
                  return const CustomError();
                }
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Text("Service Providers",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(
              height: size.height * 0.01,
            ),
            BlocBuilder<ServicecategoriesCubit, ServicecategoriesState>(
              builder: (context, state) {
                if (state is ServicecategoriesStateLoading) {
                  return const CustomLoading();
                } else if (state is ServicecategoriesStateLoaded) {
                  final serviceDataList = state.categoryModel.data;
                  return ServiceProvidersBuilder(
                    size: size,
                    serviveProviders: ServiceModel(
                      data: serviceDataList,
                    ),
                  );
                } else {
                  return const CustomError();
                }
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            const Text("Venues",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(
              height: size.height * 0.01,
            ),
            const VenueBuilder(),
          ],
        ),
      ),
    )));
  }
}

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      color: AppColors.error,
      child: const Center(
        child: Text(
          "Some Thing is wrong",
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: LoadingItem(),
      ),
    );
  }
}
