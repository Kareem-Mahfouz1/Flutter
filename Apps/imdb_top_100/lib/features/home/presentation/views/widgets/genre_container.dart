import 'package:flutter/material.dart';
import 'package:imdb_top_100/core/utils/styles.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({super.key, required this.genre});
  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.tertiary),
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        genre,
        style: Styles.textStyle16,
      ),
    );
  }
}
