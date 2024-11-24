import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../models/cart_product.dart';

abstract class CartRepo {
  Future<Either<Failure, int>> addToCart({
    required int userId,
    required CartProduct product,
  });
  Future<Either<Failure, List<CartProduct>>> getCartItems({
    required int userId,
  });
}
