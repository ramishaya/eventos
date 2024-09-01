// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:eventos/core/errors/failure.dart';
import 'package:eventos/core/utils/api_services/api_services.dart';
import 'package:eventos/features/home/data/models/category_model.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:eventos/features/home/data/models/venue_model.dart';
import 'package:eventos/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl({
    required this.apiService,
  });
  @override
  Future<Either<Failure, CategoryModel>> fetchEventsCategories() async {
    try {
      var data = await apiService.get(
        endpoint: "event-categories",
      );
      if (data["status"] == true) {
        CategoryModel response = CategoryModel.fromJson(data);
        // ignore: avoid_print
        print("we got the events category data: ${response.data?[1].name}");

        return right(response);
      } else {
        throw ServerFailure(data["message"]);
      }
    } catch (e) {
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("error in get events categories" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ServiceModel>> fetchServiceCategories() async {
    try {
      var data = await apiService.get(
        endpoint: "service-categories",
      );
      if (data["status"] == true) {
        ServiceModel response = ServiceModel.fromJson(data);
        // ignore: avoid_print
        print(
            "we got the service providers category data: ${response.data?[1].name}");

        return right(response);
      } else {
        throw ServerFailure(data["message"]);
      }
    } catch (e) {
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("error in get events categories" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, VenueModel>> fetchVenues() async {
    try {
      var data = await apiService.get(
        endpoint: "venues",
      );
      if (data["status"] == true) {
        VenueModel response = VenueModel.fromJson(data);
        // ignore: avoid_print
        print("we got the Venue data: ${response.data?[1].name}");

        return right(response);
      } else {
        throw ServerFailure(data["message"]);
      }
    } catch (e) {
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("error in get venue repository" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ServiceProvidersModel>> fetchServiceProviders(
      int id) async {
    try {
      var data = await apiService.get(
        endpoint: "service-providers/$id"
      );
      if (data["status"] == true) {
        ServiceProvidersModel response = ServiceProvidersModel.fromJson(data);
       

        return right(response);
      } else {
        throw ServerFailure(data["message"]);
      }
    } catch (e) {
      // ignore: avoid_print, prefer_interpolation_to_compose_strings
      print("error in get Service Providers repository" + e.toString());
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
