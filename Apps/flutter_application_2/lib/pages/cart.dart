// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/model.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              fit: BoxFit.cover,
              'images/gradient.jpg',
            ),
          ),
          Positioned.fill(
            top: 100,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 200),
                  Stack(
                    children: [
                      Center(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 125,
                        ),
                      ),
                      Center(
                        heightFactor: 2,
                        child: Text(
                          context.watch<User>().counter.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                CircleAvatar(
                  backgroundImage: NetworkImage(context.read<User>().imageUrl!),
                ),
                SizedBox(width: 10)
              ],
            ),
          )
        ],
      ),
    );
  }
}
