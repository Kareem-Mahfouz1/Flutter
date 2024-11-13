part of 'fresh_drops_cubit.dart';

sealed class FreshDropsState extends Equatable {
  const FreshDropsState();

  @override
  List<Object> get props => [];
}

final class FreshDropsInitial extends FreshDropsState {}

final class FreshDropsLoading extends FreshDropsState {}

final class FreshDropsSuccess extends FreshDropsState {
  final Result result;

  const FreshDropsSuccess(this.result);
}

final class FreshDropsFailure extends FreshDropsState {
  final String errMessage;

  const FreshDropsFailure(this.errMessage);
}
