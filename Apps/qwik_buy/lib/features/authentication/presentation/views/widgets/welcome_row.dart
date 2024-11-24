import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/widgets/custom_text_button.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class WelcomeRow extends StatelessWidget {
  const WelcomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Welcome,',
          style: Styles.textStyle30,
        ),
        CustomTextButton(
          text: 'Sign Up',
          color: kPrimaryColor,
          style: Styles.textStyle18,
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSignUpView);
          },
        )
      ],
    );
  }
}
