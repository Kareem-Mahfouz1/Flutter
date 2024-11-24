import 'package:get_it/get_it.dart';
import 'package:qwik_buy/core/utils/web_service.dart';
import 'package:qwik_buy/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:qwik_buy/features/cart/data/repos/cart_repo_impl.dart';
import 'package:qwik_buy/features/explore/data/repos/explore_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(),
  );
  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  getIt.registerSingleton<CartRepoImpl>(
    CartRepoImpl(),
  );
  getIt.registerSingleton<ExploreRepoImpl>(
    ExploreRepoImpl(WebService()),
  );
}
