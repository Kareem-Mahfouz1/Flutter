import 'package:e_commerce_app/data/models/rating.dart';

class Product {
  late int id;
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  late Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  Product.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    price = double.parse(map['price'].toString());
    description = map['description'];
    category = map['category'];
    image = map['image'];
    rating = Rating.fromMap(map['rating']);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
    return map;
  }
}
