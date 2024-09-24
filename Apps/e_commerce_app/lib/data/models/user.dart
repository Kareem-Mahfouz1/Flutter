import 'package:e_commerce_app/data/models/address.dart';
import 'package:e_commerce_app/data/models/name.dart';

class User {
  late Address address;
  late int? id;
  late String email;
  late String username;
  late String password;
  late Name name;
  late String phone;

  User();
  User.fromMap(Map<String, dynamic> map) {
    address = Address.fromMap(map['address']);
    id = map['id'];
    email = map['email'];
    username = map['username'];
    password = map['password'];
    name = Name.fromMap(map['name']);
    phone = map['phone'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'address': address.toMap(),
      if (id != null) 'id': id,
      'email': email,
      'username': username,
      'password': password,
      'name': name.toMap(),
      'phone': phone,
    };
    return map;
  }
}
