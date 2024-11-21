import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qwik_buy/core/utils/app_router.dart';
import 'package:qwik_buy/features/explore/data/models/result/product.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/grid_view_item.dart';

class NewestItemsGridView extends StatelessWidget {
  const NewestItemsGridView({super.key, required this.products});
  final List<Product>? products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        childAspectRatio: .48,
      ),
      itemCount: products!.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.kItemDetailsView, extra: products![index]);
            },
            child: GridViewItem(product: products![index]));
      },
    );
  }
}
