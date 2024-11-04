import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/categorey_items_grid_view.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/custom_category_app_bar.dart';

class CategoreyViewBody extends StatelessWidget {
  const CategoreyViewBody({super.key, required this.categorey});
  final String categorey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        CustomCategoryAppBar(categorey: categorey),
        const SizedBox(height: 15),
        const Expanded(child: CategoreyItemsGridView())
      ],
    );
  }
}
