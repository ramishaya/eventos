import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:eventos/features/home/data/repos/home_repo.dart';

part 'service_categories_state.dart';

class ServicecategoriesCubit extends Cubit<ServicecategoriesState> {
  ServicecategoriesCubit({required this.homeRepo})
      : super(ServicecategoriesStateInitial());
  final HomeRepo homeRepo;

  Future<void> fetchServiceProvidersCategories() async {
    emit(ServicecategoriesStateLoading());
    var finalResponse = await homeRepo.fetchServiceCategories();
    finalResponse.fold((failure) {
      // ignore: avoid_print
      print("we got an error  in the events category cubit");
      emit(ServicecategoriesStateFailure(errMessage: failure.errMessage));
    }, (success) {
      // ignore: avoid_print
      print("we emited the data in the service providers cubit   ");
      emit(ServicecategoriesStateLoaded(categoryModel: success));
    });
  }
}
