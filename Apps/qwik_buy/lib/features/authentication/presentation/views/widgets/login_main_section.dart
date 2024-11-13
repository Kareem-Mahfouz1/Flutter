import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_button.dart';
import 'package:qwik_buy/core/widgets/custom_text_button.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';
import 'package:qwik_buy/features/authentication/presentation/manager/auth_cubit/auth_cubit.dart';

import '../../../../../core/functions/text_field_borders.dart';
import 'welcome_row.dart';

class LoginMainSection extends StatelessWidget {
  const LoginMainSection({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController email = TextEditingController();
  static final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //ONLY FOR TESTING
    email.text = 'someone@example.com';
    password.text = '123456789';
    //ONLY FOR TESTING
    return Material(
      color: Colors.white,
      elevation: 3,
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WelcomeRow(),
              const SizedBox(height: 10),
              const FadedText(text: 'Sign in to Continue'),
              const SizedBox(height: 45),
              TextFormField(
                cursorColor: kPrimaryColor,
                controller: email,
                decoration: InputDecoration(
                  label: const FadedText(text: 'Email'),
                  enabledBorder: enabledBorder(),
                  focusedBorder: focusedBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 35),
              TextFormField(
                obscureText: true,
                cursorColor: kPrimaryColor,
                controller: password,
                decoration: InputDecoration(
                  label: const FadedText(text: 'Password'),
                  enabledBorder: enabledBorder(),
                  focusedBorder: focusedBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password can\'t be less than 6 characters';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextButton(
                    text: 'Forgot Password?',
                    style: Styles.textStyle14,
                    color: Colors.black,
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .loginUser(email.text, password.text);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
