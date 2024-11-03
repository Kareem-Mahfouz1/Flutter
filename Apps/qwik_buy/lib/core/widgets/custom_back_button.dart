import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 20,
      onPressed: () => GoRouter.of(context).pop(),
      icon: const Icon(FontAwesomeIcons.chevronLeft),
    );
  }
}
