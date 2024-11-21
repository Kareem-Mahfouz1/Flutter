import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_text_button.dart';
import 'package:qwik_buy/features/explore/data/models/result/product.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/custom_info_container.dart';

class ItemDetailsMainSection extends StatelessWidget {
  const ItemDetailsMainSection({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name!,
          style: Styles.textStyle26,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomInfoContainer(
              title: 'Size',
              value: 'XL',
            ),
            CustomInfoContainer(
              title: 'Color',
              value: product.colour!,
            ),
          ],
        ),
        const SizedBox(height: 40),
        Text(
          'Details',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Text(
          'Brand: ${product.brandName!}',
          style: Styles.textStyle14,
        ),
        CustomTextButton(
          text: 'Read More',
          color: kPrimaryColor,
          style: Styles.textStyle14,
          onPressed: () {},
        ),
        const SizedBox(height: 30),
        Text(
          'Reviews',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        CustomTextButton(
          text: 'Write your Review',
          color: kPrimaryColor,
          style: Styles.textStyle14,
          onPressed: () {},
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * .5),
        SizedBox(height: MediaQuery.sizeOf(context).height * .12),
      ],
    );
  }
}
