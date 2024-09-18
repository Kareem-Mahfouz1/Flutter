import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  int? phone;
  int counter = 0;
  String? imageUrl =
      'https://i.pinimg.com/736x/83/bc/8b/83bc8b88cf6bc4b4e04d153a418cde62.jpg';
  void assignDetails(
      {required String newname,
      required String newemail,
      required String newpassword,
      required int newphone,
      String? newimage}) {
    name = newname;
    email = newemail;
    password = newpassword;
    phone = newphone;
  }

  void dec() {
    if (counter == 0) return;
    counter--;
    notifyListeners();
  }

  void inc() {
    counter++;
    notifyListeners();
  }
}
