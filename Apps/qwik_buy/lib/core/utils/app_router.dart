import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qwik_buy/core/utils/service_locator.dart';
import 'package:qwik_buy/features/authentication/data/repos/auth_repo_impl.dart';
import 'package:qwik_buy/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
              child: const LoginView(),
            ),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0, 1), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kSignUpView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: BlocProvider(
              create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
              child: const SignupView(),
            ),
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1, 0), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kExploreView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const ExploreView(),
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1, 0), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kCategoreyView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: CategoreyView(
              categorey: state.extra as String,
            ),
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1, 0), end: const Offset(0, 0))
                    .animate(animation),
                child: child,
              );
            },
          );
        },
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
