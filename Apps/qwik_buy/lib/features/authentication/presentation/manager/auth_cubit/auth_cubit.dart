import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwik_buy/features/authentication/data/models/user.dart';
import 'package:qwik_buy/features/authentication/data/repos/auth_repo.dart';

part 'auth_state.dart';

//TODO
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  int? id;

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    var response = await authRepo.loginUser(email: email, password: password);
    response.fold(
      (failure) {
        emit(LoginFailure(errMessage: failure.errMessage));
      },
      (id) {
        this.id = id;
        emit(LoginSuccess(id: id));
      },
    );
  }

  Future<void> signupUser(User user) async {
    emit(SignupLoading());
    var response = await authRepo.signupUser(user: user);
    response.fold(
      (failure) {
        emit(SignupFailure(errMessage: failure.errMessage));
      },
      (id) {
        emit(SignupSuccess());
      },
    );
  }
}
