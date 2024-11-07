import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(kPrimaryColor),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: Styles.textStyle14,
        ),
      ),
    );
  }
}
