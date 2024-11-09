import 'package:dartz/dartz.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/explore/data/models/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> loginUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> signupUser({required User user});
}
