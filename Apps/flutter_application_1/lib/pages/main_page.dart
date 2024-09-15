// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/favourite_recipes.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/resources.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static int selectedIndex = 0;

  static const List<Widget> pages = [
    Home(),
    Favourites(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedFontSize: 0,
          iconSize: 32,
          currentIndex: selectedIndex,
          selectedItemColor: Consts.myClr,
          onTap: (value) => setState(() {
            selectedIndex = value;
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined), label: ''),
          ],
        ),
        body: pages[selectedIndex]);
  }
}
