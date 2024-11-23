import 'package:dartz/dartz.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/cart/data/models/cart_product.dart';

abstract class CartRepo {
  Future<Either<Failure, int>> addToCart({
    required int userId,
    required CartProduct product,
  });
  Future<Either<Failure, List<CartProduct>>> getCartItems({
    required int userId,
  });
}
