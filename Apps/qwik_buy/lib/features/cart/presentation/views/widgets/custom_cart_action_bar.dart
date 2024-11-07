import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/custom_button.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';

class CustomCartActionBar extends StatelessWidget {
  const CustomCartActionBar({super.key});

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
                '\$1500',
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
