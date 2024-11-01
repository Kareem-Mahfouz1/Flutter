import 'package:flutter/material.dart';
import 'package:qwik_buy/core/widgets/custom_text_button.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class WelcomeRow extends StatelessWidget {
  const WelcomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Welcome,',
          style: Styles.textStyle30,
        ),
        CustomTextButton(
          text: 'Sign Up',
          color: kPrimaryColor,
          style: Styles.textStyle18,
        )
      ],
    );
  }
}
