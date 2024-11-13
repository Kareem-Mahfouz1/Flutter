import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qwik_buy/core/utils/app_router.dart';
import 'package:qwik_buy/core/utils/service_locator.dart';
import 'package:qwik_buy/features/explore/data/repos/explore_repo_impl.dart';
import 'package:qwik_buy/features/explore/presentation/manager/categories_cubit/categories_cubit.dart';

void main() async {
  await dotenv.load();
  setupServiceLocator();
  runApp(const QwikBuy());
}

class QwikBuy extends StatelessWidget {
  const QwikBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit(
        getIt.get<ExploreRepoImpl>(),
      )..fetchCategories(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.robotoTextTheme(),
        ),
      ),
    );
  }
}
