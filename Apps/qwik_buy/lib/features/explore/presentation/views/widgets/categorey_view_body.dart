import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/custom_category_app_bar.dart';

class CategoreyViewBody extends StatelessWidget {
  const CategoreyViewBody({super.key, required this.categorey});
  final String categorey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomCategoryAppBar(categorey: categorey),
          ],
        ),
      ),
    );
  }
}
