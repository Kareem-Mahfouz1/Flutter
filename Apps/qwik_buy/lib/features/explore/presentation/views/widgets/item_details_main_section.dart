import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_text_button.dart';
import 'package:qwik_buy/features/explore/presentation/views/widgets/custom_info_container.dart';

class ItemDetailsMainSection extends StatelessWidget {
  const ItemDetailsMainSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nike Dri-FIT Long Sleeve',
          style: Styles.textStyle26,
        ),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomInfoContainer(
              title: 'Size',
              value: 'XL',
            ),
            CustomInfoContainer(
              title: 'Color',
              value: 'Black',
            ),
          ],
        ),
        const SizedBox(height: 40),
        Text(
          'Details',
          style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const Text(
          'Nike Dri-FIT is a polyester fabric designed to help you keep dry so you can more comfortably work harder, longer.',
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
        SizedBox(height: MediaQuery.sizeOf(context).height * .12),
      ],
    );
  }
}
