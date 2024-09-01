part of 'service_categories_cubit.dart';

class ServicecategoriesState extends Equatable {
  const ServicecategoriesState();

  @override
  List<Object> get props => [];
}

class ServicecategoriesStateInitial extends ServicecategoriesState {}

class ServicecategoriesStateLoading extends ServicecategoriesState {}

class ServicecategoriesStateLoaded extends ServicecategoriesState {
  final ServiceModel categoryModel;

  const ServicecategoriesStateLoaded({required this.categoryModel});
}

class ServicecategoriesStateFailure extends ServicecategoriesState {
  final String errMessage;

  const ServicecategoriesStateFailure({required this.errMessage});
}
