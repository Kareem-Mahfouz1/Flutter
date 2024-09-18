// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model.dart';
import 'package:flutter_application_2/pages/register.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => User(),
      builder: (context, child) => MaterialApp(
        theme:
            ThemeData(appBarTheme: AppBarTheme(foregroundColor: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: Register(),
      ),
    );
  }
}

class Consts {
  static const double spc = 25;
  static const txt1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}
