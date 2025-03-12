import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/constatnts.dart';
import 'package:imdb_top_100/core/utils/service_locator.dart';
import 'package:imdb_top_100/core/utils/styles.dart';
import 'package:imdb_top_100/core/widgets/custom_error_widget.dart';
import 'package:imdb_top_100/features/home/data/repos/movies_repo/movies_repo_impl.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/movie_details_cubit/movie_details_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/cubits/movies_cubit/movies_cubit.dart';
import 'package:imdb_top_100/features/home/presentation/views/movie_details_view.dart';
import 'package:imdb_top_100/features/home/presentation/views/widgets/movie_grid_view_item.dart';

class MoviesBody extends StatelessWidget {
  const MoviesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
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
          child: BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              if (state is MoviesSuccess) {
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .5,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2,
                  ),
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => MovieDetailsCubit(
                                  getIt.get<MoviesRepoImpl>())
                                ..getMovieDetails(state.movies[index].rank!),
                              child: const MovieDetailsView(),
                            ),
                          ),
                        );
                      },
                      child: MovieGridViewItem(item: state.movies[index]),
                    );
                  },
                );
              } else if (state is MoviesFailure) {
                return Center(
                    child: CustomErrorWidget(errMessage: state.errMessage));
              } else {
                return Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.onSecondary,
                ));
              }
            },
          ),
        ));
  }
}
