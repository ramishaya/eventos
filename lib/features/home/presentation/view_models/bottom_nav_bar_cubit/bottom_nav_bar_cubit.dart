

import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarInitial(tabIndex: 0));

  void tabChange(int tabIndex) {
    emit(BottomNavBarInitial(tabIndex: tabIndex));
  }
}
