import 'package:qwik_buy/features/authentication/data/local_data.dart';
import 'package:qwik_buy/features/authentication/data/models/user.dart';
import 'package:qwik_buy/features/authentication/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  DbManager manager = DbManager();
  @override
  Future<bool> loginUser(
      {required String email, required String password}) async {
    return await manager.loginUser(email, password);
  }

  @override
  Future<bool> signupUser({required User user}) async {
    return await manager.signupUser(user);
  }
}
