import 'dart:io';

import 'package:eventos/core/errors/failure.dart';
import 'package:eventos/features/authentication/data/models/login_model.dart';
import 'package:dartz/dartz.dart';
import 'package:eventos/features/authentication/data/models/register_model.dart';
import 'package:eventos/features/authentication/data/models/send_code_model.dart';


abstract class AuthenticationRepoistory {
  Future<Either<Failure, LoginSuccessModel>> login(
      {required String email, required String password});

  Future<Either<Failure, RegisterSuccessModel>> register(
      {required File profileImage,
      required String birthDate,
      required String name,
      required String email,
      required String password,
      required String governorate});

  Future<Either<Failure, SendCodeModel>> sendCode({
    required String email,
  });
}
