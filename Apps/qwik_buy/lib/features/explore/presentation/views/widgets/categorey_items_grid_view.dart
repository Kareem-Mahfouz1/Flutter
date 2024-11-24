import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../data/models/result/product.dart';
import 'grid_view_item.dart';

class CategoreyItemsGridView extends StatelessWidget {
  const CategoreyItemsGridView({super.key, this.products});
  final List<Product>? products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
      child: GridView.builder(
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
      ),
    );
  }
}
