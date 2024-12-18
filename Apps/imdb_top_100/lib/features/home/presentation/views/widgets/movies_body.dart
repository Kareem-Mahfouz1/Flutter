import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/features/home/data/models/movie_details.dart';
import 'package:imdb_top_100/features/home/data/models/movie_item.dart';
import 'package:imdb_top_100/features/home/presentation/views/movie_details_view.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/movie_grid_view_item.dart';

// TODO:remove
MovieItem item = MovieItem.fromJson(const {
  "rank": 1,
  "title": "The Shawshank Redemption",
  "description":
      "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
  "image":
      "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,1,380,562_.jpg",
  "big_image":
      "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@",
  "genre": ["Drama"],
  "thumbnail":
      "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg",
  "rating": "9.3",
  "id": "top1",
  "year": 1994,
  "imdbid": "tt0111161",
  "imdb_link": "https://www.imdb.com/title/tt0111161"
});
MovieDetails details = MovieDetails.fromJson(const {
  "rank": 1,
  "title": "The Shawshank Redemption",
  "thumbnail":
      "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg",
  "rating": "9.3",
  "id": "top1",
  "year": 1994,
  "image":
      "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_QL75_UX380_CR0,1,380,562_.jpg",
  "big_image":
      "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@",
  "description":
      "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
  "trailer": "https://www.youtube.com/watch?v=NmzuHjWmXOc",
  "trailer_embed_link": "https://www.youtube.com/embed/NmzuHjWmXOc",
  "trailer_youtube_id": "NmzuHjWmXOc",
  "genre": ["Drama"],
  "director": ["Frank Darabont"],
  "writers": [
    "Stephen King(based on the short novel \"Rita Hayworth and the Shawshank Redemption\" by)",
    "Frank Darabont(screenplay by)"
  ],
  "imdbid": "tt0111161",
  "imdb_link": "https://www.imdb.com/title/tt0111161"
});

class MoviesBody extends StatelessWidget {
  const MoviesBody({super.key});

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
                title: Text('Top 100 Movies', style: Styles.textStyle24),
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
                      builder: (context) => MovieDetailsView(details: details),
                    ));
                  },
                  child: MovieGridViewItem(item: item),
                );
              },
            ),
          )),
    ));
  }
}
