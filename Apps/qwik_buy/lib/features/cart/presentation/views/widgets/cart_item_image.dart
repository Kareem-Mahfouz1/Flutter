import 'package:flutter/material.dart';
import 'package:qwik_buy/core/utils/assets.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          MyAssets.testImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
