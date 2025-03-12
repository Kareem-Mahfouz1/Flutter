import 'package:dartz/dartz.dart';
import 'package:imdb_top_100/core/errors/failures.dart';
import 'package:imdb_top_100/features/home/data/models/movie_details.dart';
import 'package:imdb_top_100/features/home/data/models/movie_item.dart';

abstract class MoviesRepo {
  Future<Either<Failure, List<MovieItem>>> getMoviesList();
  Future<Either<Failure, MovieDetails>> getMovieDetails(int rank);
}
