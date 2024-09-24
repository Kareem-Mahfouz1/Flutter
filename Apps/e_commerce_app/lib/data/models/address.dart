import 'package:e_commerce_app/data/models/geolocation.dart';

class Address {
  late Geolocation geolocation;
  late String city;
  late String street;
  late int number;
  late String zipcode;

  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  Address.fromMap(Map<String, dynamic> map) {
    geolocation = Geolocation.fromMap(map['geolocation']);
    city = map['city'];
    street = map['street'];
    number = map['number'];
    zipcode = map['zipcode'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'geolocation': geolocation.toMap(),
      'city': city,
      'street': street,
      'number': number,
      'zipcode': zipcode,
    };
    return map;
  }
}
