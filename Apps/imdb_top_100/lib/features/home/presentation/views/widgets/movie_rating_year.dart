import 'package:flutter/material.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/features/home/data/models/movie_item.dart';

class MovieRatingYear extends StatelessWidget {
  const MovieRatingYear({super.key, required this.item});
  final MovieItem item;

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
            item.rating!,
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
            item.year!.toString(),
            style: Styles.textStyle16,
          ),
        )
      ],
    );
  }
}
