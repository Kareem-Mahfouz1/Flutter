import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

import 'other_login_button.dart';

class OtherLoginSection extends StatelessWidget {
  const OtherLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        OtherLoginButton(
          text: 'Sign In with Facebook',
          image: MyAssets.facebookLogo,
        ),
        SizedBox(height: 20),
        OtherLoginButton(
          text: 'Sign In with Google',
          image: MyAssets.googleLogo,
        ),
      ],
    );
  }
}
