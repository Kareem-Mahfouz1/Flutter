import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_back_button.dart';
import 'signup_main_section.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          CustomBackButton(),
          SizedBox(height: 30),
          SignupMainSection()
        ],
      ),
    );
  }
}
