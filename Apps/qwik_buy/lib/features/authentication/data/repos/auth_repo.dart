import 'package:dartz/dartz.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/authentication/data/models/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, int>> loginUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, int>> signupUser({required User user});
}