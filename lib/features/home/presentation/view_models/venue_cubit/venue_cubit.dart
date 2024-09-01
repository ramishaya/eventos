import 'package:equatable/equatable.dart';
import 'package:eventos/features/home/data/models/venue_model.dart';
import 'package:eventos/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'venue_state.dart';

class VenueCubit extends Cubit<VenueState> {
  VenueCubit({required this.homeRepo}) : super(VenueStateInitial());

  final HomeRepo homeRepo;

  Future<void> fetchVenues() async {
    emit(VenueStateLoading());
    var finalResponse = await homeRepo.fetchVenues();
    finalResponse.fold((failure) {
      // ignore: avoid_print
      print("we got an error  in the venues cubit");
      emit(VenueStateFailure(errMessage: failure.errMessage));
    }, (success) {
      // ignore: avoid_print
      print("we emited the data in the Venues cubit   ");
      emit(VenueStateLoaded(venueModel: success));
    });
  }
}
