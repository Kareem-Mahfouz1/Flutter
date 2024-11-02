import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';

import 'custom_text_search_field.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomTextSearchField(),
        const SizedBox(width: 13),
        IconButton(
          padding: const EdgeInsets.all(9),
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
              foregroundColor: WidgetStatePropertyAll(Colors.white)),
          onPressed: () {},
          iconSize: 28,
          icon: const Icon(Icons.camera_alt_outlined),
        )
      ],
    );
  }
}
