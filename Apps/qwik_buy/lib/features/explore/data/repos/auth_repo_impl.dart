import 'package:dartz/dartz.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/explore/data/models/user.dart';
import 'package:qwik_buy/features/explore/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, User>> loginUser(
      {required String email, required String password}) {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> signupUser({required User user}) {
    // TODO: implement signupUser
    throw UnimplementedError();
  }
}
