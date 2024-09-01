import 'package:eventos/core/utils/constants/app_texts.dart';
import 'package:eventos/core/utils/constants/assets_data.dart';
import 'package:eventos/core/utils/router/app_router.dart';
import 'package:eventos/features/authentication/presentation/view_models/onBoarding_cubit/on_boarding_cubit.dart';
import 'package:eventos/features/authentication/presentation/views/onBoarding/widgets/onboarding_dot_navigation.dart';
import 'package:eventos/features/authentication/presentation/views/onBoarding/widgets/onboarding_next_button.dart';
import 'package:eventos/features/authentication/presentation/views/onBoarding/widgets/onboarding_page.dart';
import 'package:eventos/features/authentication/presentation/views/onBoarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listener: (context, state) {
        if (state is OnBoardinigIsFinished) {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          PageView(
            controller: onBoardingCubit.pageController,
            onPageChanged: (index) {
              onBoardingCubit.updatePageIndex(index);
            },
            children: const [
              OnBoardingPage(
                  image: AssetsData.onBoradingImage1,
                  title: AppText.onBoardingTitle1,
                  subTitle: AppText.onBoardingSubTitle1),
              OnBoardingPage(
                  image: AssetsData.onBoradingImage2,
                  title: AppText.onBoardingTitle2,
                  subTitle: AppText.onBoardingSubTitle2),
              OnBoardingPage(
                  image: AssetsData.onBoradingImage3,
                  title: AppText.onBoardingTitle3,
                  subTitle: AppText.onBoardingSubTitle3),
            ],
          ),
          OnBoardingSkip(
            onBoardingCubit: onBoardingCubit,
          ),
          OnBoardingDotNavigation(
              pageController: onBoardingCubit.pageController),
          OnBoardingNextButton(
            onBoardingCubit: onBoardingCubit,
          )
        ],
      )),
    );
  }
}
