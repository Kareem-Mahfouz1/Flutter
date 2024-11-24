import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/authentication/data/repos/auth_repo_impl.dart';
import 'features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';
import 'features/cart/data/repos/cart_repo_impl.dart';
import 'features/cart/presentation/manager/cart_cubit/cart_cubit.dart';

void main() async {
  await dotenv.load();
  setupServiceLocator();
  runApp(const QwikBuy());
}

class QwikBuy extends StatelessWidget {
  const QwikBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => CartCubit(getIt.get<CartRepoImpl>()),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: ThemeData().copyWith(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.robotoTextTheme(),
          ),
        ));
  }
}
