import 'package:flutter/material.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/features/home/data/models/series_item.dart';

class SeriesRatingYear extends StatelessWidget {
  const SeriesRatingYear({super.key, required this.item});
  final SeriesItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        ),
        const SizedBox(width: 5),
        Opacity(
          opacity: .75,
          child: Text(
            item.rating!.toString(),
            style: Styles.textStyle16,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.tertiary),
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            item.year!,
            style: Styles.textStyle16,
          ),
        )
      ],
    );
  }
}
