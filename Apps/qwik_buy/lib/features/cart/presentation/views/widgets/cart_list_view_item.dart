import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/features/cart/data/models/cart_product.dart';
import 'package:qwik_buy/features/cart/presentation/views/widgets/cart_item_image.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.product});
  final CartProduct product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
      height: 120,
      child: Row(
        children: [
          CartItemImage(product: product),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle16,
                ),
                Text(
                  '\$${product.price}',
                  style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 30,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: Styles.textStyle14,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
