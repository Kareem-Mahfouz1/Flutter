import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/cart_product.dart';

double calculateTotal(List<CartProduct> products) {
  double total = 0;
  for (var element in products) {
    total += element.price;
  }
  return total;
}

class CartListViewSummary extends StatelessWidget {
  const CartListViewSummary({super.key, required this.subTotal});
  final double subTotal;
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
                '\$${subTotal.toStringAsFixed(2)}',
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
                '\$${(subTotal * 0.14).toStringAsFixed(2)}',
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
