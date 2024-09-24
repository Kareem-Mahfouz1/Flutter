// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/data/network/store_api.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:e_commerce_app/pages/register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: Consts.txt1.copyWith(fontSize: 40),
              ),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin:
                    EdgeInsets.only(right: 20, left: 20, top: 75, bottom: 20),
                decoration: BoxDecoration(
                    color: Consts.grey,
                    borderRadius: BorderRadius.circular(Consts.rad)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Login',
                      style: Consts.txt1,
                    ),
                    TextFormField(
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      controller: username,
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    TextFormField(
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      obscureText: true,
                      controller: password,
                      decoration: InputDecoration(hintText: 'password'),
                    ),
                    SizedBox(),
                    ElevatedButton(
                      onPressed: () async {
                        User user = User();
                        bool isRegistered = false;
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Please wait...'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FutureBuilder<User>(
                                  future: StoreApi.logUserin(
                                      username.text, password.text),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      isRegistered = false;
                                      return Text(snapshot.error.toString());
                                    }
                                    if (snapshot.hasData) {
                                      user = snapshot.data!;
                                      isRegistered = true;
                                      return Text(
                                          'Login successful.Press anywhere to continue.');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                        if (isRegistered) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Home(user: user),
                            ),
                            (route) => false,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(120, 50),
                          backgroundColor: Colors.white,
                          foregroundColor: Consts.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Consts.rad))),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Is this your first time?',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          )),
                      child: Text('Register!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Consts.teal)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
