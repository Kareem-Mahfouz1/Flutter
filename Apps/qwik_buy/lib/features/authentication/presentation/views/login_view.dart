import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../core/utils/app_router.dart';
import '../manager/auth_cubit/auth_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          GoRouter.of(context).go(AppRouter.kExploreView);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        bool isLoading = state is LoginLoading;
        return Scaffold(
          body: SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: isLoading,
              child: const LoginViewBody(),
            ),
          ),
        );
      },
    );
  }
}
