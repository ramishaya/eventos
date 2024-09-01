part of 'on_boarding_cubit.dart';

class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object> get props => [];

  get currentPageIndex => null;
}

class OnBoardingInitial extends OnBoardingState {
  @override
  final int currentPageIndex;

  const OnBoardingInitial({required this.currentPageIndex});

  @override
  List<Object> get props => [currentPageIndex];
}

class OnBoardinigIsFinished extends OnBoardingState {
  const OnBoardinigIsFinished();

  @override
  List<Object> get props => [];
}
