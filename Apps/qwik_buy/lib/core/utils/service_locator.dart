import 'package:get_it/get_it.dart';
import 'web_service.dart';
import '../../features/authentication/data/repos/auth_repo_impl.dart';
import '../../features/cart/data/repos/cart_repo_impl.dart';
import '../../features/explore/data/repos/explore_repo_impl.dart';
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
