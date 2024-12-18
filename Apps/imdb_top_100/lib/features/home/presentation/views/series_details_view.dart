import 'package:flutter/material.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/features/home/data/models/series_details.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/imdb_button.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/series_details_body.dart';

class SeriesDetailsView extends StatelessWidget {
  const SeriesDetailsView({super.key, required this.details});
  final SeriesDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SeriesDetailsBody(details: details),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: ImdbButton(url: details.imdbLink!),
      ),
    );
  }
}
