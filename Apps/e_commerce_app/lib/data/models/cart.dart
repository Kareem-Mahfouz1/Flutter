import 'package:e_commerce_app/data/models/cart_product.dart';

class Cart {
  late int id;
  late int userId;
  late String date;
  late List<CartProduct> products;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  Cart.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    userId = map['userId'];
    date = map['date'];
    products = [];
    for (var element in (map['products'] as List)) {
      products.add(CartProduct.fromMap(element));
    }
  }

  Map<String, dynamic> toMap() {
    List<Map> tmpProducts = [];
    for (var element in products) {
      tmpProducts.add(element.toMap());
    }
    Map<String, dynamic> map = {
      'id': id,
      'userId': userId,
      'date': date,
      'products': tmpProducts,
    };
    return map;
  }
}
