import 'package:flutter/material.dart';
import 'package:qwik_buy/core/utils/styles.dart';

class FadedText extends StatelessWidget {
  const FadedText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .6,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Styles.textStyle14,
      ),
    );
  }
}
