part of 'events_category_cubit.dart';

class EventsCategoryState extends Equatable {
  const EventsCategoryState();

  @override
  List<Object> get props => [];
}

class EventsCategoryInitial extends EventsCategoryState {}

class EventsCategoryLoading extends EventsCategoryState {}

class EventsCategoryLoaded extends EventsCategoryState {
  final CategoryModel categoryModel;

  const EventsCategoryLoaded({required this.categoryModel});
}

class EventsCategoryFailure extends EventsCategoryState {
  final String errMessage;

  const EventsCategoryFailure({required this.errMessage});

}
