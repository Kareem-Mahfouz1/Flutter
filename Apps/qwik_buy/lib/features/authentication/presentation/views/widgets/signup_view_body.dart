import 'package:flutter/material.dart';
import 'package:qwik_buy/features/authentication/presentation/views/widgets/signup_main_section.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          BackButton(),
          SizedBox(height: 30),
          SignupMainSection()
        ],
      ),
    );
  }
}
