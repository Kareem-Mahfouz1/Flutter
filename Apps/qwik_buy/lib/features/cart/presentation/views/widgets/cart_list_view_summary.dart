import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';

class CartListViewSummary extends StatelessWidget {
  const CartListViewSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: kHoriontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sub Total',
                style: Styles.textStyle16,
              ),
              Text(
                '\$3950',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Tax',
                style: Styles.textStyle16,
              ),
              Text(
                '\$50',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
