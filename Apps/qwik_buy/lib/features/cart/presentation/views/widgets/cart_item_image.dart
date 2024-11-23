import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qwik_buy/core/widgets/custom_loading_indicator.dart';
import 'package:qwik_buy/features/cart/data/models/cart_product.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key, required this.product});
  final CartProduct product;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          imageUrl: 'https://${product.image}',
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, progress) =>
              const CustomLoadingIndicator(),
        ),
      ),
    );
  }
}
