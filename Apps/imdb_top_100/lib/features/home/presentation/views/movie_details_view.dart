import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/widgets/custom_error_widget.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/movie_details_body.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/imdb_button.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return MovieDetailsBody(details: state.details);
          } else if (state is MovieDetailsFailure) {
            return Center(
              child: CustomErrorWidget(errMessage: state.errMessage),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsSuccess) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: ImdbButton(url: state.details.imdbLink!),
            );
          } else if (state is MovieDetailsFailure) {
            return Center(
              child: CustomErrorWidget(errMessage: state.errMessage),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            );
          }
        },
      ),
    );
  }
}
