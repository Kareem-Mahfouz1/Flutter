import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwik_buy/features/authentication/data/models/user.dart';
import 'package:qwik_buy/features/authentication/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    bool response = await authRepo.loginUser(email: email, password: password);
    if (response == true) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure());
    }
  }

  Future<void> signupUser(User user) async {
    emit(SignupLoading());
    bool response = await authRepo.signupUser(user: user);
    if (response == true) {
      emit(SignupSuccess());
    } else {
      emit(SignupFailure());
    }
  }
}
