// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app/data/models/user.dart';
import 'package:e_commerce_app/data/network/store_api.dart';
import 'package:e_commerce_app/main.dart';
import 'package:e_commerce_app/pages/home.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController number = TextEditingController();
  final TextEditingController zipcode = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Welcome',
                style: Consts.txt1.copyWith(fontSize: 40),
              ),
              Container(
                height: 800,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin:
                    EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 10),
                decoration: BoxDecoration(
                    color: Consts.grey,
                    borderRadius: BorderRadius.circular(Consts.rad)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Register',
                      style: Consts.txt1,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: Consts.txt1.copyWith(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 5,
                                  child: TextFormField(
                                    controller: firstname,
                                    onTapOutside: (event) => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    decoration:
                                        InputDecoration(hintText: 'First name'),
                                  )),
                              Flexible(
                                flex: 1,
                                child: Text(''),
                              ),
                              Flexible(
                                flex: 5,
                                child: TextFormField(
                                    controller: lastname,
                                    onTapOutside: (event) => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    decoration:
                                        InputDecoration(hintText: 'Last name')),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.grey,
                          ),
                          Text(
                            'Address',
                            style: Consts.txt1.copyWith(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 5,
                                  child: TextFormField(
                                    controller: city,
                                    onTapOutside: (event) => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    decoration:
                                        InputDecoration(hintText: 'City'),
                                  )),
                              Flexible(
                                flex: 1,
                                child: Text(''),
                              ),
                              Flexible(
                                flex: 5,
                                child: TextFormField(
                                    controller: street,
                                    onTapOutside: (event) => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    decoration:
                                        InputDecoration(hintText: 'Street')),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 5,
                                  child: TextFormField(
                                    controller: number,
                                    keyboardType: TextInputType.number,
                                    onTapOutside: (event) => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    decoration: InputDecoration(
                                        hintText: 'Apt. Number'),
                                  )),
                              Flexible(
                                flex: 1,
                                child: Text(''),
                              ),
                              Flexible(
                                flex: 5,
                                child: TextFormField(
                                    controller: zipcode,
                                    keyboardType: TextInputType.number,
                                    onTapOutside: (event) => FocusManager
                                        .instance.primaryFocus
                                        ?.unfocus(),
                                    decoration:
                                        InputDecoration(hintText: 'Zip Code')),
                              )
                            ],
                          ),
                          Divider(
                            thickness: 3,
                            color: Colors.grey,
                          ),
                          Text(
                            'Contact information',
                            style: Consts.txt1.copyWith(fontSize: 20),
                          ),
                          TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            decoration: InputDecoration(hintText: 'Email'),
                          ),
                          TextFormField(
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            decoration:
                                InputDecoration(hintText: 'Phone Number'),
                          ),
                          TextFormField(
                            controller: username,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            decoration: InputDecoration(hintText: 'Username'),
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: true,
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            decoration: InputDecoration(hintText: 'Password'),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                    SizedBox(),
                    ElevatedButton(
                      onPressed: () async {
                        int id;
                        bool isRegistered = false;
                        await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Please wait...'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FutureBuilder(
                                  future: StoreApi.registerUser(User.fromMap({
                                    'address': {
                                      'geolocation': {
                                        'lat': '0.0',
                                        'long': '0.0',
                                      },
                                      'city': city.text,
                                      'street': street.text,
                                      'number': int.parse(number.text),
                                      'zipcode': zipcode.text,
                                    },
                                    'email': email.text,
                                    'username': username.text,
                                    'password': password.text,
                                    'name': {
                                      'firstname': firstname.text,
                                      'lastname': lastname.text,
                                    },
                                    'phone': phone.text,
                                  })),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      isRegistered = false;
                                      return Text(snapshot.error.toString());
                                    }
                                    if (snapshot.hasData) {
                                      isRegistered = true;
                                      return Text(
                                          'Regestiration successful.Press anywhere to continue.');
                                    }
                                    return CircularProgressIndicator();
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                        if (isRegistered) {
                          // User user = await  StoreApi.getUserByUsername(username.text); -> the new user
                          User user =
                              await StoreApi.getUserByUsername('kevinryan');
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
                          minimumSize: Size(130, 50),
                          backgroundColor: Colors.white,
                          foregroundColor: Consts.teal,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Consts.rad))),
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Login!',
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
