import 'package:flutter/material.dart';
import 'package:qwik_buy/constants.dart';
import 'package:qwik_buy/core/utils/assets.dart';
import 'package:qwik_buy/core/utils/styles.dart';
import 'package:qwik_buy/core/widgets/faded_text.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: .68,
          child: Image.asset(MyAssets.testImage),
        ),
        const Text(
          'Leather Wristwatch',
          style: Styles.textStyle16,
          maxLines: 2,
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
