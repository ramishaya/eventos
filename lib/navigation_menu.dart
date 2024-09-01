import 'package:eventos/core/utils/constants/colors.dart';
import 'package:eventos/features/create_event/presentation/views/create_event_view.dart';
import 'package:eventos/features/create_event/presentation/views/my_events.dart';
import 'package:eventos/features/home/presentation/views/home/home.dart';
import 'package:eventos/features/home/presentation/view_models/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';
import 'package:eventos/features/reels/data/models/reels_model.dart';
import 'package:eventos/features/reels/presentation/views/reels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});
  final List<BottomNavigationBarItem> bottomNavItems =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
    const BottomNavigationBarItem(icon: Icon(Iconsax.video), label: "Reels"),
    const BottomNavigationBarItem(icon: Icon(Icons.event), label: "Create Event"),
    const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "My Events"),
  ];

  final List<Widget> navPages = <Widget>[
    const HomeView(),
    ReelsView(
      reels: ReelsModel(status: true, data: [
        ReelData(video: "assets/images/logos/reel3.mp4", title: "Reel1"),
        ReelData(video: "assets/images/logos/reel.mp4" , title: "Reel2")
      ]),
    ),
    const CreateEventView(),
     MyEvents()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            body: navPages.elementAt(state.tabIndex),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (tabIndex) {
                BlocProvider.of<BottomNavBarCubit>(context).tabChange(tabIndex);
              },
              currentIndex: state.tabIndex,
              items: bottomNavItems,
              elevation: 5,
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.secondaryColor2,
              unselectedItemColor: AppColors.darkGrey,
              enableFeedback: true,
            ));
      },
    );
  }
}
