import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:eventos/features/create_event/data/repos/create_event_repo.dart';
import 'package:eventos/features/create_event/data/models/create_event_model.dart';

part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  final CreateEventRepo createEventRepo;

  CreateEventCubit(this.createEventRepo) : super(CreateEventInitial());

  Future<void> createEvent({
    required String title,
    required int eventCategoryId,
    required String description,
    required int pepoleNumber,
    required int venueId,
    required List<int> serviceProviderId,
    required String date,
    required String type,
    required List<TimeLine> timeLine,
  }) async {
    emit(CreateEventLoading());

    var response = await createEventRepo.createEvent(
      title: title,
      eventCategoryId: eventCategoryId,
      description: description,
      pepoleNumber: pepoleNumber,
      venueId: venueId,
      serviceProviderId: serviceProviderId,
      date: date,
      type: type,
      timeLine: timeLine,
    );

    response.fold(
        (failure) => emit(CreateEventFailure(errMessage: failure.errMessage)),
        (success) => emit(CreateEventLoaded(sucessMessage: success)));
  }
}
