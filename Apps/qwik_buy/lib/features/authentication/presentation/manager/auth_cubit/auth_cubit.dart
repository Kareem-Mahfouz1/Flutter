import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/user.dart';
import '../../../data/repos/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());
    var response = await authRepo.loginUser(email: email, password: password);
    response.fold(
      (failure) {
        emit(LoginFailure(errMessage: failure.errMessage));
      },
      (id) async {
        final prefs = getIt.get<SharedPreferences>();
        prefs.setInt('id', id);
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
