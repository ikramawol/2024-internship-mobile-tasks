import 'dart:core';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_clean/core/error/failure.dart';

import 'package:ecommerce_clean/features/user/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> signUp(UserEntity user);
  Future<Either<Failure, String>> logIn(String email, String password);
  Future<Either<Failure, void>> logOut();
  Future<Either<Failure, UserEntity>> getMe();
}
