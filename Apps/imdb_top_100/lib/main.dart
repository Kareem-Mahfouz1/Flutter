import 'package:flutter/material.dart';
import 'package:imdb_top_100/core/utils/themes.dart';
import 'package:imdb_top_100/features/home/presentation/views/home_view.dart';

void main() {
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
      // home: const SplashView(),
      home: const HomeView(),
    );
  }
}
