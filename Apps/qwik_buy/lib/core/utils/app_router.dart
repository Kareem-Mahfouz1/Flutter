import 'package:go_router/go_router.dart';
import 'package:qwik_buy/features/authentication/presentation/views/login_view.dart';
import 'package:qwik_buy/features/authentication/presentation/views/signup_view.dart';
import 'package:qwik_buy/features/explore/presentation/views/explore_view.dart';

import '../../features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kSignUpView = '/SignUpView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ExploreView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignupView(),
    ),
  ]);
}
