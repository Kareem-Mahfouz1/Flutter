import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_button.dart';
import 'package:qwik_buy/core/widgets/custom_text_button.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';

import '../../../../../core/functions/text_field_borders.dart';
import 'welcome_row.dart';

class LoginMainSection extends StatelessWidget {
  const LoginMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 3,
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeRow(),
            const SizedBox(height: 10),
            const FadedText(text: 'Sign in to Continue'),
            const SizedBox(height: 45),
            TextField(
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                label: const FadedText(text: 'Email'),
                enabledBorder: enabledBorder(),
                focusedBorder: focusedBorder(),
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                label: const FadedText(text: 'Password'),
                enabledBorder: enabledBorder(),
                focusedBorder: focusedBorder(),
              ),
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
            const CustomButton(
              text: 'SIGN IN',
            )
          ],
        ),
      ),
    );
  }
}
