import 'package:dartz/dartz.dart';
import 'package:qwik_buy/core/errors/failure.dart';
import 'package:qwik_buy/features/cart/data/local_cart.dart';
import 'package:qwik_buy/features/cart/data/models/cart_product.dart';
import 'package:qwik_buy/features/cart/data/repos/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  @override
  Future<Either<Failure, int>> addToCart(
      {required int userId, required CartProduct product}) async {
    return await CartManager.addToCart(userId: userId, product: product);
  }

  @override
  Future<Either<Failure, List<CartProduct>>> getCartItems(
      {required int userId}) async {
    return await CartManager.getCartItems(userId: userId);
  }
}
