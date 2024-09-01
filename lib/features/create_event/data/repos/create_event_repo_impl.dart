import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eventos/core/errors/failure.dart';
import 'package:eventos/core/utils/api_services/api_services.dart';
import 'package:eventos/core/utils/local_storage/local_storage.dart';
import 'package:eventos/features/create_event/data/models/create_event_model.dart';
import 'package:eventos/features/create_event/data/models/my_event.dart';
import 'package:eventos/features/create_event/data/repos/create_event_repo.dart';
import 'package:eventos/features/create_event/presentation/views/my_events.dart';

class CreateEventRepoImpl implements CreateEventRepo {
  final ApiService apiService;

  CreateEventRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, String>> createEvent({
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
    try {
      // Construct the JSON data
      var data = {
        "title": title,
        "event_category_id": eventCategoryId,
        "description": description,
        "people_number": pepoleNumber,
        "venue_id": venueId,
        "service_provider_ids": serviceProviderId,
        "date": date,
        "type": type,
        "timelines": timeLine
            .map((t) => {
                  "start_time": t.startTime,
                  "end_time": t.endTime,
                  "description": t.description,
                })
            .toList(),
      };

      // Make the POST request
      var response = await apiService.post(
        endpoint: "create-events",
        data: data,
        token: LocalStorage.getData(key: "token"),
      );

      CreateEventModel createEventResponse =
          CreateEventModel.fromJson(response);

      print(
          "we have created the event successfuly${createEventResponse.message}");
      return Right(createEventResponse.message!);
    } catch (e) {
      // Error handling
      print("Error in create event repository: ${e.toString()}");

      if (e is DioException) {
        if (e.response!.statusCode == 401) {
          return Left(ServerFailure("Your email or password is not correct"));
        }
        if (e.response!.statusCode == 403) {
          return Left(ServerFailure(
              "Your account is not verified. Check your email for verification code."));
        }
        if (e.response!.statusCode == 422) {
          return Left(
              ServerFailure("You should complete your account information"));
        }
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, MyEventsModel>> myEvent() async {
    try {
      var data = await apiService.get(
        endpoint: "my-events",
        bearerToken: LocalStorage.getData(key: "token"),
      );
      // print(data);
      if (data["status"] == true) {
        MyEventsModel response =   MyEventsModel.fromJson(data);
        // ignore: avoid_print
        // print("we got the Service Providers data we got it **********: ${response.data?[0].name}");
        // print("we got the my eventts coorect${response.data}");

        return right(response);
      } else {
        throw ServerFailure(data["message"]);
      }
    } catch (e) {
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("error in get my events  repository" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
  // @override
  // Future<Either<Failure, MyEvents>> myEvent() async{
  //   try{

  //   }catch(e){

  //   }
  // }
}
