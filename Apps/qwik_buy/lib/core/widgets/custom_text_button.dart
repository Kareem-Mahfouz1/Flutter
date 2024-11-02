import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle style;
  final Function()? onPressed;
  const CustomTextButton(
      {super.key,
      required this.text,
      required this.color,
      required this.style,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: style.copyWith(color: color),
      ),
    );
  }
}
