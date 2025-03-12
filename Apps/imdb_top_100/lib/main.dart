import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:imdb_top_100/core/utils/service_locator.dart';
import 'package:imdb_top_100/core/utils/themes.dart';
import 'package:imdb_top_100/features/splash/splash_view.dart';

void main() async {
  setupServiceLocator();
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashView(),
    );
  }
}
