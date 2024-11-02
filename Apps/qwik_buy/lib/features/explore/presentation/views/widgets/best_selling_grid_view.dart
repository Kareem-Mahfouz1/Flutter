import 'package:flutter/material.dart';

import 'Best_selling_grid_view_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: .51),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const BestSellingGridViewItem();
      },
    );
  }
}
