import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_loading_indicator.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';
import 'package:qwik_buy/features/explore/data/models/result/product.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
            aspectRatio: .68,
            child: Hero(
              tag: product.imageUrl!,
              child: CachedNetworkImage(
                imageUrl: 'https://${product.imageUrl!}',
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) =>
                    const CustomLoadingIndicator(),
              ),
            )),
        Text(
          product.name!,
          style: Styles.textStyle16,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        FadedText(text: product.brandName!),
        Text(
          product.price!.current!.text!,
          style: Styles.textStyle16.copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
