class CartProduct {
  late int productId;
  late String name;
  late String price;
  late String image;

  CartProduct.fromMap(Map<String, dynamic> map) {
    productId = map['product_id'];
    name = map['name'];
    price = map['price'];
    image = map['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'product_id': productId,
      'name': name,
      'price': price,
      'image': image,
    };
  }
}
