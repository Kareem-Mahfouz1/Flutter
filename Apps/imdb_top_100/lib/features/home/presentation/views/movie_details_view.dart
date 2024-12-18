import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/features/home/data/models/movie_details.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/movie_details_body.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/imdb_button.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key, required this.details});
  final MovieDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MovieDetailsBody(details: details),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ImdbButton(url: details.imdbLink!),
      ),
    );
  }
}
