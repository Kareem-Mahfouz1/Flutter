part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  List<ProductModel> products;

  HomeSuccess({required this.products});
}

final class HomeFailure extends HomeState {}
