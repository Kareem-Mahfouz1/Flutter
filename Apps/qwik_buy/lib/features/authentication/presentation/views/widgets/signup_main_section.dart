import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/functions/text_field_borders.dart';
import 'package:qwik_buy/core/utils/app_router.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_button.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';

class SignupMainSection extends StatelessWidget {
  const SignupMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
      child: Material(
        color: Colors.white,
        elevation: 3,
        child: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: Styles.textStyle30,
              ),
              const SizedBox(height: 45),
              TextField(
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  label: const FadedText(text: 'Name'),
                  enabledBorder: enabledBorder(),
                  focusedBorder: focusedBorder(),
                ),
              ),
              const SizedBox(height: 35),
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
              const SizedBox(height: 45),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.kExploreView);
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
