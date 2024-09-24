// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(foregroundColor: Consts.teal)),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}

class Consts {
  static const double rad = 20;
  static Color grey = Colors.grey[300]!;
  static Color teal = Colors.teal[400]!;
  static const txt1 =
      TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold);
}
