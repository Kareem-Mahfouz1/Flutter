// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/functions/text_field_borders.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/faded_text.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(FontAwesomeIcons.chevronLeft),
          ),
          SizedBox(height: 30),
          SignupMainSection()
        ],
      ),
    );
  }
}

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
              Text(
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
              const CustomButton(
                text: 'SIGN UP',
              )
            ],
          ),
        ),
      ),
    );
  }
}
