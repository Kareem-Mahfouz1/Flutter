import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';

import 'custom_text_search_field.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({super.key});

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
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kCartView);
          },
          iconSize: 26,
          icon: const Icon(Icons.shopping_cart_outlined),
        )
      ],
    );
  }
}
