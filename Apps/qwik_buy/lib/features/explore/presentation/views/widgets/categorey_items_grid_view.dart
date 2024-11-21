import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';

class CategoreyItemsGridView extends StatelessWidget {
  const CategoreyItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          childAspectRatio: .50,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          //TODO: return const GridViewItem(product: p,);
        },
      ),
    );
  }
}
