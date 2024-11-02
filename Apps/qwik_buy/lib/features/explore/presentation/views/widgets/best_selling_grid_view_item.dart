import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/assets.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';

class BestSellingGridViewItem extends StatelessWidget {
  const BestSellingGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AspectRatio(
          aspectRatio: .68,
          child: Image.asset(MyAssets.testImage),
        ),
        const Text(
          'Leather Wristwatch',
          style: Styles.textStyle16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const FadedText(text: 'Tag Heuer'),
        Text(
          '\$450',
          style: Styles.textStyle16.copyWith(color: kPrimaryColor),
        )
      ],
    );
  }
}
