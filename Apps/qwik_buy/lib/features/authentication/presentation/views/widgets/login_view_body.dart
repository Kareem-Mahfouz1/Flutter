import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import 'login_main_section.dart';
import 'other_login_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double scrnHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: scrnHeight * .12),
            const LoginMainSection(),
            SizedBox(height: scrnHeight * .025),
            const Text(
              '-OR-',
              style: Styles.textStyle18,
            ),
            SizedBox(height: scrnHeight * .04),
            const OtherLoginSection(),
          ],
        ),
      ),
    );
  }
}
