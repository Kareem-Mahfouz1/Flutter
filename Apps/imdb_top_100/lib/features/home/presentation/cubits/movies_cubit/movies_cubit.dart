import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/features/home/data/models/movie_item.dart';
import 'package:imdb_top_100/features/home/data/repos/movies_repo/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this.moviesRepo) : super(MoviesInitial());
  final MoviesRepo moviesRepo;

  void getMoviesList() async {
    emit(MoviesLoading());
    final result = await moviesRepo.getMoviesList();
    result.fold(
      (left) {
        emit(MoviesFailure(errMessage: left.errMessage));
      },
      (right) {
        emit(MoviesSuccess(movies: right));
      },
    );
  }
}
