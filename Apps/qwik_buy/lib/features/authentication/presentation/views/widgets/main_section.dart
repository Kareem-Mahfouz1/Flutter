import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_button.dart';
import 'package:qwik_buy/core/widgets/custom_text_button.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';

import 'welcome_row.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

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
            const SizedBox(height: 50),
            TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                label: const FadedText(text: 'Email'),
                enabledBorder: enabledBorder(),
                focusedBorder: focusedBorder(),
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                label: const FadedText(text: 'Password'),
                enabledBorder: enabledBorder(),
                focusedBorder: focusedBorder(),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextButton(
                  text: 'Forgot Password?',
                  style: Styles.textStyle14,
                  color: Colors.black,
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

  UnderlineInputBorder enabledBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    );
  }

  UnderlineInputBorder focusedBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: kPrimaryColor,
        width: 2,
      ),
    );
  }
}
