import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/features/home/data/models/movie_details.dart';
import 'package:imdb_top_100/features/home/data/repos/movies_repo/movies_repo.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.moviesRepo) : super(MovieDetailsInitial());
  final MoviesRepo moviesRepo;

  void getMovieDetails(int rank) async {
    final result = await moviesRepo.getMovieDetails(rank);
    result.fold(
      (left) {
        emit(MovieDetailsFailure(errMessage: left.errMessage));
      },
      (right) {
        emit(MovieDetailsSuccess(details: right));
      },
    );
  }
}
