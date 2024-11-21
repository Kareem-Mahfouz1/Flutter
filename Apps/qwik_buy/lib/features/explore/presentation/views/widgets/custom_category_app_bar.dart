import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_back_button.dart';

class CustomCategoryAppBar extends StatelessWidget {
  const CustomCategoryAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomBackButton(),
        Text(
          title,
          style: Styles.textStyle20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: kHoriontalPadding - 5),
          child: IconButton(
            padding: const EdgeInsets.all(8),
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
                foregroundColor: WidgetStatePropertyAll(Colors.white)),
            onPressed: () {},
            iconSize: 21,
            icon: const Icon(FontAwesomeIcons.magnifyingGlass),
          ),
        )
      ],
    );
  }
}
