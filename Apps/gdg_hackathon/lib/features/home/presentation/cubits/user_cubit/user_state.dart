part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserSuccess extends UserState {
  final User user;

  const UserSuccess({required this.user});
}

final class UserFailure extends UserState {
  final String errMessage;

  const UserFailure({required this.errMessage});
}
