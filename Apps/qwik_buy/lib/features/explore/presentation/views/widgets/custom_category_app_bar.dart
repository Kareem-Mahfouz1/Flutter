import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_back_button.dart';

class CustomCategoryAppBar extends StatelessWidget {
  const CustomCategoryAppBar({super.key, required this.categorey});
  final String categorey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(),
        Text(
          categorey,
          style: Styles.textStyle20,
        ),
        IconButton(
          padding: const EdgeInsets.all(9),
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
              foregroundColor: WidgetStatePropertyAll(Colors.white)),
          onPressed: () {},
          iconSize: 26,
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        )
      ],
    );
  }
}
