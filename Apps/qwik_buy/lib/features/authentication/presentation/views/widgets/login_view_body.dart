import 'package:flutter/material.dart';

import 'main_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 120),
            MainSection(),
          ],
        ),
      ),
    );
  }
}
