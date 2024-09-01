// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventos/core/utils/local_storage/local_storage.dart';
import 'package:flutter/material.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(const OnBoardingInitial(currentPageIndex: 0));
  PageController pageController = PageController();

  void updatePageIndex(int index) {
    emit(OnBoardingInitial(currentPageIndex: index));
  }

  void nextPage() {
    int nextPageIndex = state.currentPageIndex + 1;
    if (nextPageIndex < 3) {

      pageController.animateToPage(
        nextPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(OnBoardingInitial(currentPageIndex: nextPageIndex));
    } else {
      LocalStorage.saveData(key: "isFirstTime", value: "false");
      emit(const OnBoardinigIsFinished());
    }
  }

  void skip() {
    emit(const OnBoardingInitial(currentPageIndex: 2));
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
