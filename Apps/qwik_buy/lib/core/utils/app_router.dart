import 'package:go_router/go_router.dart';
import 'package:qwik_buy/features/authentication/presentation/views/login_view.dart';
import 'package:qwik_buy/features/authentication/presentation/views/signup_view.dart';
import 'package:qwik_buy/features/cart/presentation/views/cart_view.dart';
import 'package:qwik_buy/features/explore/presentation/views/categorey_view.dart';
import 'package:qwik_buy/features/explore/presentation/views/explore_view.dart';
import 'package:qwik_buy/features/explore/presentation/views/item_details_view.dart';

import '../../features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const kCartView = '/CartView';
  static const kLoginView = '/loginView';
  static const kSignUpView = '/SignUpView';
  static const kExploreView = '/ExploreView';
  static const kCategoreyView = '/CategoreyView';
  static const kItemDetailsView = '/ItemDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kExploreView,
        builder: (context, state) => const ExploreView(),
      ),
      GoRoute(
        path: kCategoreyView,
        builder: (context, state) => CategoreyView(
          categorey: state.extra as String,
        ),
      ),
      GoRoute(
        path: kItemDetailsView,
        builder: (context, state) => const ItemDetailsView(),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) => const CartView(),
      ),
    ],
  );
}
