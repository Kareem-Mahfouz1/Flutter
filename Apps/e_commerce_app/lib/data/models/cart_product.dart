class CartProduct {
  late int productId;
  late int quantity;

  CartProduct.fromMap(Map<String, dynamic> map) {
    productId = map['productId'];
    quantity = map['quantity'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'productId': productId,
      'quantity': quantity,
    };
    return map;
  }
}
