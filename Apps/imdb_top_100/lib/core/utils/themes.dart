import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
        onPrimary: Colors.grey[200]!,
        primary: myWhite,
        secondary: myYellow,
        tertiary: myBlue,
        onSecondary: myBlack),
    brightness: Brightness.light,
  );
  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
        onPrimary: Colors.grey[900]!,
        primary: myBlack,
        secondary: myYellow,
        tertiary: const Color.fromARGB(255, 13, 104, 135),
        onSecondary: Colors.grey.shade100),
    brightness: Brightness.dark,
  );
}
