import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/functions/text_field_borders.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/faded_text.dart';
import '../../../data/models/user.dart';
import '../../manager/auth_cubit/auth_cubit.dart';

class SignupMainSection extends StatelessWidget {
  const SignupMainSection({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static final TextEditingController name = TextEditingController();
  static final TextEditingController email = TextEditingController();
  static final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
      child: Material(
        color: Colors.white,
        elevation: 3,
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sign Up',
                  style: Styles.textStyle30,
                ),
                const SizedBox(height: 45),
                TextFormField(
                  cursorColor: kPrimaryColor,
                  controller: name,
                  decoration: InputDecoration(
                    label: const FadedText(text: 'Name'),
                    enabledBorder: enabledBorder(),
                    focusedBorder: focusedBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    final nameRegex = RegExp(r"^[a-zA-Z\s]+$");
                    if (!nameRegex.hasMatch(value)) {
                      return 'Name must contain only letters and spaces';
                    }
                    if (value.length < 2) {
                      return 'Name must be at least 2 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 35),
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
                    final emailRegex =
                        RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
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
                const SizedBox(height: 45),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: CustomButton(
                    text: 'SIGN UP',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).signupUser(
                          User.fromMap(
                            {
                              'name': name.text,
                              'email': email.text,
                              'password': password.text,
                            },
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
