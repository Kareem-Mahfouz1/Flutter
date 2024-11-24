import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/faded_text.dart';

class CustomCartActionBar extends StatelessWidget {
  const CustomCartActionBar({super.key, required this.total});
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FadedText(text: 'TOTAL'),
              Text(
                '\$${total.toStringAsFixed(2)}',
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
            width: 140,
            child: CustomButton(text: 'CHECKOUT'),
          )
        ],
      ),
    );
  }
}
