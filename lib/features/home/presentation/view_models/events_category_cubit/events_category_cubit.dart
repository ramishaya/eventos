import 'package:equatable/equatable.dart';
import 'package:eventos/features/home/data/models/category_model.dart';
import 'package:eventos/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'events_category_state.dart';

class EventsCategoryCubit extends Cubit<EventsCategoryState> {
  EventsCategoryCubit({required this.homeRepo})
      : super(EventsCategoryInitial());
  final HomeRepo homeRepo;

  Future<void> fetchEventsCategories() async {
    emit(EventsCategoryLoading());
    var finalResponse = await homeRepo.fetchEventsCategories();
    finalResponse.fold((failure) {
      // ignore: avoid_print
      print("we got an error  in the events category cubit");
      emit(EventsCategoryFailure(errMessage: failure.errMessage));
    }, (success) {
      // ignore: avoid_print
      print("we got the data in the events category cubit  ");
      emit(EventsCategoryLoaded(categoryModel: success));
    });
  }
}
