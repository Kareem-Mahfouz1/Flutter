import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_product.dart';
import '../../../data/repos/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  Future<void> getCartItems({required int userId}) async {
    emit(CartLoading());
    var response = await cartRepo.getCartItems(userId: userId);
    response.fold(
      (failure) {
        emit(CartFailure(errMessage: failure.errMessage));
      },
      (cart) {
        emit(CartProductsSuccess(products: cart));
      },
    );
  }

  Future<void> addToCart(
      {required int userId, required CartProduct product}) async {
    emit(CartLoading());
    var response = await cartRepo.addToCart(userId: userId, product: product);
    response.fold(
      (failure) {
        emit(CartFailure(errMessage: failure.errMessage));
      },
      (id) {
        emit(CartAddSuccess());
      },
    );
  }
}
