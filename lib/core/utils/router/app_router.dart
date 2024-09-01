import 'package:eventos/core/utils/dependency_management/service_locator.dart';
import 'package:eventos/core/utils/router/custom_transitions.dart';
import 'package:eventos/features/authentication/data/repos/authentication_repoistory_impl.dart';
import 'package:eventos/features/authentication/presentation/view_models/image_picker_cubit/imagepicker_cubit.dart';
import 'package:eventos/features/authentication/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:eventos/features/authentication/presentation/view_models/onBoarding_cubit/on_boarding_cubit.dart';
import 'package:eventos/features/authentication/presentation/view_models/register_cubit/register_cubit.dart';
import 'package:eventos/features/authentication/presentation/views/forget_password/forget_password.dart';
import 'package:eventos/features/authentication/presentation/views/login/login.dart';
import 'package:eventos/features/authentication/presentation/views/onBoarding/onboarding.dart';
import 'package:eventos/features/authentication/presentation/views/register/register.dart';
import 'package:eventos/features/authentication/presentation/views/splash/splash_view.dart';
import 'package:eventos/features/create_event/data/repos/create_event_repo_impl.dart';
import 'package:eventos/features/create_event/presentation/view_models/cubit/my_event_cubit.dart';
import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:eventos/features/home/data/models/venue_model.dart';
import 'package:eventos/features/home/data/repos/home_repo_impl.dart';
import 'package:eventos/features/home/presentation/view_models/service_providers_cubit/service_providers_cubit.dart';
import 'package:eventos/features/home/presentation/views/home/home.dart';
import 'package:eventos/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/events_category_cubit/events_category_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/service_categories_cubit/service_categories_cubit.dart';
import 'package:eventos/features/home/presentation/view_models/venue_cubit/venue_cubit.dart';
import 'package:eventos/features/home/presentation/views/service_providers_view/service_provider_details.dart';
import 'package:eventos/features/home/presentation/views/service_providers_view/service_providers_view.dart';
import 'package:eventos/features/home/presentation/views/venue_details/venue_details.dart';
import 'package:eventos/navigation_menu.dart';
import 'package:go_router/go_router.dart';
import "package:flutter_bloc/flutter_bloc.dart";

abstract class AppRouter {
  static const kSplashView = "/";
  static const kOnBoardingView = "/kOnBoardingView";
  static const kLoginView = "/kLoginView";
  static const kHomeView = "/kHomeView";
  static const kRegisterView = "/kRegisterView";
  static const kForgetPasswordView = "/kForgetPasswordView";
  static const kNavigationMenu = "/kNavigationMenu";
  static const kVenueDetails = "/kVenueDetails";
  static const kServiceProvidersView = "/kServiceProvidersView";
  static const kServiceProviderDetails = "/kServiceProviderDetails";

  static final router = GoRouter(routes: [
    GoRoute(
      path: kSplashView,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kOnBoardingView,
      builder: (context, state) => BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: const OnBoardingView(),
      ),
    ),
    GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) => CustomTransitionPage(
            child: BlocProvider(
              create: (context) => LoginCubit(
                  authenticationRepoistory:
                      getIt.get<AuthenticationRepoistoryImpl>()),
              child: const LoginView(),
            ),
            transitionsBuilder: MyCustomTransitions.slideTransition)),
    GoRoute(
        path: kRegisterView,
        pageBuilder: (context, state) => CustomTransitionPage(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RegisterCubit(
                      authenticationRepoistory:
                          getIt.get<AuthenticationRepoistoryImpl>()),
                ),
                BlocProvider(
                  create: (context) => ImagepickerCubit(),
                ),
              ],
              child: const RegisterView(),
            ),
            transitionsBuilder: MyCustomTransitions.slideFromRightTransition)),
    GoRoute(
        path: kForgetPasswordView,
        pageBuilder: (context, state) => CustomTransitionPage(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => RegisterCubit(
                      authenticationRepoistory:
                          getIt.get<AuthenticationRepoistoryImpl>()),
                ),
                BlocProvider(
                  create: (context) => ImagepickerCubit(),
                ),
              ],
              child: const ForgetPasswordView(),
            ),
            transitionsBuilder: MyCustomTransitions.slideFromRightTransition)),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => BlocProvider(
        create: (context) => OnBoardingCubit(),
        child: const HomeView(),
      ),
    ),
    GoRoute(
        path: kNavigationMenu,
        pageBuilder: (context, state) => CustomTransitionPage(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      EventsCategoryCubit(homeRepo: getIt.get<HomeRepoImpl>())
                        ..fetchEventsCategories(),
                ),
                BlocProvider(
                    create: (context) => ServicecategoriesCubit(
                        homeRepo: getIt.get<HomeRepoImpl>())
                      ..fetchServiceProvidersCategories()),
                BlocProvider(
                  create: (context) => BottomNavBarCubit(),
                ),
                BlocProvider(
                  create: (context) =>
                      VenueCubit(homeRepo: getIt.get<HomeRepoImpl>())
                        ..fetchVenues(),
                ),
                BlocProvider(
                    create: (context) =>
                        MyEventCubit(getIt.get<CreateEventRepoImpl>())
                          ..fetchMyEvents())
              ],
              child: NavigationMenu(),
            ),
            transitionsBuilder: MyCustomTransitions.fadeTransition)),
    GoRoute(
        path: kVenueDetails,
        pageBuilder: (context, state) {
          Data venueDetails = state.extra as Data;
          return CustomTransitionPage(
              child: VenueDetails(venueDetails: venueDetails),
              transitionsBuilder: MyCustomTransitions.slideFromRightTransition);
        }),
    GoRoute(
        path: kServiceProvidersView,
        pageBuilder: (context, state) {
          ServiceData serviceData = state.extra as ServiceData;
          return CustomTransitionPage(
              child: BlocProvider(
                create: (context) =>
                    ServiceProvidersCubit(homeRepo: getIt.get<HomeRepoImpl>())
                      ..fetchServiceProviders(serviceData.id!),
                child: ServiceProvidersView(
                  service: serviceData,
                ),
              ),
              transitionsBuilder: MyCustomTransitions.fadeTransition);
        }),
    GoRoute(
        path: kServiceProviderDetails,
        pageBuilder: (context, state) {
          ServiceProviderDetails providersDetailsData =
              state.extra as ServiceProviderDetails;
          return CustomTransitionPage(
              child: ServiceProviderSViewDetails(
                  providersDetailsData: providersDetailsData),
              transitionsBuilder: MyCustomTransitions.fadeTransition);
        }),
  ]);
}
