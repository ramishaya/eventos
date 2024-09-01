import 'package:dartz/dartz.dart';
import 'package:eventos/core/errors/failure.dart';
import 'package:eventos/features/create_event/data/models/create_event_model.dart';
import 'package:eventos/features/create_event/data/models/my_event.dart';
import 'package:eventos/features/create_event/presentation/views/my_events.dart';

abstract class CreateEventRepo {
  Future<Either<Failure, String>> createEvent(
      {required String title,
      required int eventCategoryId,
      required String description,
      required int pepoleNumber,
      required int venueId,
      required List<int> serviceProviderId,
      required String date,
      required String type,
      required List<TimeLine> timeLine});

  Future<Either<Failure, MyEventsModel>> myEvent();
}
