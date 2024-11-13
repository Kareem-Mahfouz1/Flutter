part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {
  final int id;

  const LoginSuccess({required this.id});
}

final class LoginFailure extends AuthState {
  final String errMessage;

  const LoginFailure({required this.errMessage});
}

final class LoginLoading extends AuthState {}

final class SignupSuccess extends AuthState {}

final class SignupFailure extends AuthState {
  final String errMessage;

  const SignupFailure({required this.errMessage});
}

final class SignupLoading extends AuthState {}
