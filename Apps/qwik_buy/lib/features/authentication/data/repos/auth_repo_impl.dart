import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../local_users.dart';
import '../models/user.dart';
import 'auth_repo.dart';

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
