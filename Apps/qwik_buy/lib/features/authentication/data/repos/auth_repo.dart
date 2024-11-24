import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, int>> loginUser({
    required String email,
    required String password,
  });
  Future<Either<Failure, int>> signupUser({required User user});
}
