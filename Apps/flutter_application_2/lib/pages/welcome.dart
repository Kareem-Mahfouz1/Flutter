// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/model.dart';
import 'package:flutter_application_2/pages/cart.dart';
import 'package:provider/provider.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
                  Text(
                    'Welcome ${context.select<User, String>(
                      (user) => user.name,
                    )}',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(height: Consts.spc),
                  Consumer<User>(
                    builder: (context, user, child) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'name: ${user.name}',
                            style: Consts.txt1,
                          ),
                          Text('email: ${user.email}', style: Consts.txt1),
                          Text('phone: ${user.phone}', style: Consts.txt1),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Consts.spc),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Text(
                          'Shopping Counter',
                          style: Consts.txt1.copyWith(fontSize: 22),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.read<User>().dec();
                                },
                                icon: Icon(Icons.remove_circle)),
                            SizedBox(width: Consts.spc),
                            Text(
                              context.watch<User>().counter.toString(),
                              style: Consts.txt1,
                            ),
                            SizedBox(width: Consts.spc),
                            IconButton(
                                onPressed: () {
                                  context.read<User>().inc();
                                },
                                icon: Icon(Icons.add_circle)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Consts.spc),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cart()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'To shopping cart',
                            style: Consts.txt1,
                          ),
                          Icon(
                            Icons.chevron_right_outlined,
                            size: 28,
                          )
                        ],
                      ))
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
            ),
          )
        ],
      ),
    );
  }
}
