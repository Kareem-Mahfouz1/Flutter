import 'package:qwik_buy/features/authentication/data/models/user.dart';

abstract class AuthRepo {
  Future<bool> loginUser({
    required String email,
    required String password,
  });
  Future<bool> signupUser({required User user});
}
