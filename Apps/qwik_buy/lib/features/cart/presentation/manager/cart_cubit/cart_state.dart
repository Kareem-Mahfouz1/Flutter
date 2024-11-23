part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartAddSuccess extends CartState {}

final class CartProductsSuccess extends CartState {
  final List<CartProduct> products;

  const CartProductsSuccess({required this.products});
}

final class CartFailure extends CartState {
  final String errMessage;

  const CartFailure({required this.errMessage});
}

final class CartLoading extends CartState {}
