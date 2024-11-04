import 'package:flutter/material.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/grid_view_item.dart';

class NewestItemsGridView extends StatelessWidget {
  const NewestItemsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        childAspectRatio: .50,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const GridViewItem();
      },
    );
  }
}
