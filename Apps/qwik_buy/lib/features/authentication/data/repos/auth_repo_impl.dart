import 'package:dartz/dartz.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/authentication/data/local_users.dart';
import 'package:qwik_buy/features/authentication/data/models/user.dart';
import 'package:qwik_buy/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  UserManager manager = UserManager();
  @override
  Future<Either<Failure, int>> loginUser(
      {required String email, required String password}) async {
    return await manager.loginUser(email, password);
  }

  @override
  Future<Either<Failure, int>> signupUser({required User user}) async {
    return await manager.signupUser(user);
  }
}
