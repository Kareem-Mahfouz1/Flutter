import 'package:flutter/material.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/genre_container.dart';

class RatingGenre extends StatelessWidget {
  const RatingGenre({super.key, required this.rating, required this.genres});
  final List<String> genres;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star_rounded, color: Colors.yellow),
        const SizedBox(width: 5),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: rating.toString(),
                style: Styles.textStyle16,
              ),
              TextSpan(
                text: '/10',
                style: Styles.textStyle16.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genres.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: GenreContainer(genre: genres[index]),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
