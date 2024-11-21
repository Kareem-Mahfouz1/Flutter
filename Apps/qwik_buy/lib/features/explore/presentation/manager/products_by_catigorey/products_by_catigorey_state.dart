part of 'products_by_catigorey_cubit.dart';

sealed class ProductsByCatigoreyState extends Equatable {
  const ProductsByCatigoreyState();

  @override
  List<Object> get props => [];
}

final class ProductsByCatigoreyInitial extends ProductsByCatigoreyState {}

final class ProductsByCatigoreyLoading extends ProductsByCatigoreyState {}

final class ProductsByCatigoreySuccess extends ProductsByCatigoreyState {
  final Result result;

  const ProductsByCatigoreySuccess(this.result);
}

final class ProductsByCatigoreyFailure extends ProductsByCatigoreyState {
  final String errMessage;

  const ProductsByCatigoreyFailure(this.errMessage);
}
