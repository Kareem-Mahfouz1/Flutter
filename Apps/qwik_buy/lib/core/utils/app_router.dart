import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'service_locator.dart';
import '../../features/authentication/data/repos/auth_repo_impl.dart';
import '../../features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../features/authentication/presentation/views/login_view.dart';
import '../../features/authentication/presentation/views/signup_view.dart';
import '../../features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import '../../features/cart/presentation/views/cart_view.dart';
import '../../features/explore/data/models/categories/child.dart';
import '../../features/explore/data/models/result/product.dart';
import '../../features/explore/data/repos/explore_repo_impl.dart';
import '../../features/explore/presentation/manager/categories_cubit/categories_cubit.dart';
import '../../features/explore/presentation/manager/fresh_drops_cubit/fresh_drops_cubit.dart';
import '../../features/explore/presentation/manager/products_by_catigorey/products_by_catigorey_cubit.dart';
import '../../features/explore/presentation/views/categorey_view.dart';
import '../../features/explore/presentation/views/explore_view.dart';
import '../../features/explore/presentation/views/item_details_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            child: MultiBlocProvider(providers: [
              BlocProvider(
                create: (context) => CategoriesCubit(
                  getIt.get<ExploreRepoImpl>(),
                )..fetchCategories(),
              ),
              BlocProvider(
                create: (context) => FreshDropsCubit(
                  getIt.get<ExploreRepoImpl>(),
                )..fetchFreshDrops(),
              )
            ], child: const ExploreView()),
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
            child: BlocProvider(
              create: (context) =>
                  ProductsByCatigoreyCubit(getIt.get<ExploreRepoImpl>())
                    ..fetchProductsByCategorey(
                        (state.extra as Child).link!.categoryId!),
              child: CategoreyView(
                brand: state.extra as Child,
              ),
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
        builder: (context, state) => ItemDetailsView(
          product: state.extra as Product,
        ),
      ),
      GoRoute(
        path: kCartView,
        builder: (context, state) {
          final prefs = getIt.get<SharedPreferences>();
          BlocProvider.of<CartCubit>(context)
              .getCartItems(userId: prefs.getInt('id')!);
          return const CartView();
        },
      ),
    ],
  );
}
