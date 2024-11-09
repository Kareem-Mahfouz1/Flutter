import 'package:get_it/get_it.dart';
import 'package:qwik_buy/features/authentication/data/repos/auth_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(),
  );
}
