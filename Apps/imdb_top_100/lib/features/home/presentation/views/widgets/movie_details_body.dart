import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/features/home/data/models/movie_details.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/details_image.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/rating_genre.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/trailer_player.dart';

class MovieDetailsBody extends StatelessWidget {
  const MovieDetailsBody({super.key, required this.details});
  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(details.title!, style: Styles.textStyle24),
            Text(details.year.toString()),
            const SizedBox(height: 15),
            TrailerPlayer(id: details.trailerYoutubeId!),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .335,
                  child: DetailsImage(imageUrl: details.image!),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    details.description!,
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            RatingGenre(
              rating: double.parse(details.rating!),
              genres: details.genre!,
            ),
            const SizedBox(height: 15),
            const Divider(thickness: 0.5, height: 30),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: details.director!.length == 1
                        ? 'Director: '
                        : 'Directors: ',
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: details.director!.join(' • '),
                    style: Styles.textStyle16.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.5, height: 30),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        details.writers!.length == 1 ? 'Writer: ' : 'Writers: ',
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: details.writers!
                        .map((e) => e.split('(').first)
                        .toList()
                        .join(' • '),
                    style: Styles.textStyle16.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.5, height: 30),
          ],
        ),
      ),
    );
  }
}
