import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class OtherLoginButton extends StatelessWidget {
  const OtherLoginButton({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(Colors.white),
          foregroundColor: const WidgetStatePropertyAll(Colors.black),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(width: 1.5, color: Colors.grey[200]!),
            ),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Image.asset(
              image,
              height: 20,
            ),
            const Spacer(flex: 2),
            Text(
              text,
              style: Styles.textStyle14,
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
