import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/features/home/data/models/series_details.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/details_image.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/rating_genre.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/trailer_player.dart';

class SeriesDetailsBody extends StatelessWidget {
  const SeriesDetailsBody({super.key, required this.details});
  final SeriesDetails details;

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
            RatingGenre(rating: details.rating!, genres: details.genre!),
            const SizedBox(height: 15),
            const Divider(thickness: 0.5, height: 30),
          ],
        ),
      ),
    );
  }
}
