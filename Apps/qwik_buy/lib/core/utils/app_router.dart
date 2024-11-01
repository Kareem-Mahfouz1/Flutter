import 'package:go_router/go_router.dart';
import 'package:qwik_buy/features/authentication/presentation/views/login_view.dart';

import '../../features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kSignUpView = '/SignUpView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
  ]);
}
