import 'package:dartz/dartz.dart';
import 'package:eventos/core/errors/failure.dart';
import 'package:eventos/features/home/data/models/category_model.dart';
import 'package:eventos/features/home/data/models/service_model.dart';
import 'package:eventos/features/home/data/models/service_providers_model.dart';
import 'package:eventos/features/home/data/models/venue_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, CategoryModel>> fetchEventsCategories();
  Future<Either<Failure, ServiceModel>> fetchServiceCategories();
  Future<Either<Failure, VenueModel>> fetchVenues();
  Future<Either<Failure, ServiceProvidersModel>> fetchServiceProviders(int id);
}
