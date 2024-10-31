import 'package:flutter/material.dart';
import 'package:qwik_buy/core/utils/app_router.dart';

void main() {
  runApp(const QwikBuy());
}

class QwikBuy extends StatelessWidget {
  const QwikBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
