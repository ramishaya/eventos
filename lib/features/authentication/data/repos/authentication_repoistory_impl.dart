// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:eventos/core/errors/failure.dart';
import 'package:eventos/core/utils/api_services/api_services.dart';
import 'package:eventos/core/utils/local_storage/local_storage.dart';
import 'package:eventos/features/authentication/data/models/login_model.dart';
import 'package:eventos/features/authentication/data/models/register_model.dart';
import 'package:eventos/features/authentication/data/models/send_code_model.dart';
import 'package:eventos/features/authentication/data/repos/authentication_repoistory.dart';

class AuthenticationRepoistoryImpl implements AuthenticationRepoistory {
  ApiService apiService;
  AuthenticationRepoistoryImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, LoginSuccessModel>> login(
      {required String email, required String password}) async {
    try {
      var data = await apiService.post(
          endpoint: "mobile/login",
          data: {"email": email, "password": password});

      LoginSuccessModel response = LoginSuccessModel.fromJson(data);

      LocalStorage.saveData(key: "token", value: response.token);
      LocalStorage.saveData(key: "name", value: response.user!.name);

      return (Right(response));
    } catch (e) {
      // ignore: avoid_print
      print("error in login Repository");
      // ignore: avoid_print
      print(e.toString());
      if (e is DioException) {
        if (e.response!.statusCode == 401) {
          return Left(ServerFailure("Your email or password is not correct"));
        }
        if (e.response!.statusCode == 403) {
          return Left(ServerFailure(
              "Your account is not verified. Sign Up with your Information, Check your email for verification code."));
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
  Future<Either<Failure, RegisterSuccessModel>> register(
      {required File profileImage,
      required String birthDate,
      required String name,
      required String email,
      required String password,
      required String governorate}) async {
    try {
      // ignore: unused_local_variable
      String imageName = profileImage.path.split('/').last;
      FormData formData = FormData.fromMap({
        "name": name,
        "email": email,
        "password": password,
        "birthdate": birthDate,
        "governorate": governorate,
        // "profile_image": await MultipartFile.fromFile(profileImage.path,
        //     filename: imageName),
      });
      var data =
          await apiService.post(endpoint: "mobile/register", data: formData);

      RegisterSuccessModel response = RegisterSuccessModel.fromJson(data);
      LocalStorage.saveData(key: "name", value: response.user!.name);
      LocalStorage.saveData(key: "token", value: response.token);
      print("we have successfully registered ${response.user!.email}");

      return Right(response);
    } catch (e) {
      print("error in the complete Register Repository $e");
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SendCodeModel>> sendCode(
      {required String email}) async {
    try {
      var data = await apiService.post(endpoint: "user/password/email", data: {
        "email": email,
      });

      SendCodeModel response = SendCodeModel.fromJson(data);

      return (Right(response));
    } catch (e) {
      // ignore: avoid_print
      print("error in send code Repository");
      // ignore: avoid_print
      print(e.toString());
      if (e is DioException) {
        if (e.response!.statusCode == 401) {
          return Left(ServerFailure("Your email or password is not correct"));
        }
        if (e.response!.statusCode == 403) {
          return Left(ServerFailure(
              "Your account is not verified. Sign Up with your Information, Check your email for verification code."));
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
}
