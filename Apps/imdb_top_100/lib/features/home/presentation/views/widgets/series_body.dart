import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/features/home/data/models/series_details.dart';
import 'package:imdb_top_100/features/home/data/models/series_item.dart';
import 'package:imdb_top_100/features/home/presentation/views/series_details_view.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/series_grid_view_item.dart';

// TODO:remove
SeriesItem item = SeriesItem.fromJson(const {
  "rank": 1,
  "title": "Breaking Bad",
  "description":
      "A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student in order to secure his family's future.",
  "image":
      "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_QL75_UX380_CR0,1,380,562_.jpg",
  "big_image":
      "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5",
  "genre": ["Crime", "Drama", "Thriller"],
  "thumbnail":
      "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_UY67_CR0,0,45,67_AL_.jpg",
  "rating": 9.5,
  "id": "top1",
  "year": "2008-2013",
  "imdbid": "tt0903747",
  "imdb_link": "https://www.imdb.com/title/tt0903747"
});
SeriesDetails details = SeriesDetails.fromJson(const {
  "rank": 1,
  "title": "Breaking Bad",
  "thumbnail":
      "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_UY67_CR0,0,45,67_AL_.jpg",
  "rating": 9.5,
  "id": "top1",
  "year": "2008-2013",
  "image":
      "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5._V1_QL75_UX380_CR0,1,380,562_.jpg",
  "big_image":
      "https://m.media-amazon.com/images/M/MV5BYmQ4YWMxYjUtNjZmYi00MDQ1LWFjMjMtNjA5ZDdiYjdiODU5XkEyXkFqcGdeQXVyMTMzNDExODE5",
  "description":
      "A chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine with a former student in order to secure his family's future.",
  "trailer": "https://www.youtube.com/watch?v=HhesaQXLuRY",
  "trailer_embed_link": "https://www.youtube.com/embed/HhesaQXLuRY",
  "trailer_youtube_id": "HhesaQXLuRY",
  "genre": ["Crime", "Drama", "Thriller"],
  "imdbid": "tt0903747",
  "imdb_link": "https://www.imdb.com/title/tt0903747"
});

class SeriesBody extends StatelessWidget {
  const SeriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                floating: true,
                snap: true,
                title: Text('Top 100 Series', style: Styles.textStyle24),
              )
            ];
          },
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: .5,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            SeriesDetailsView(details: details),
                      ));
                    },
                    child: SeriesGridViewItem(item: item));
              },
            ),
          )),
    ));
  }
}
