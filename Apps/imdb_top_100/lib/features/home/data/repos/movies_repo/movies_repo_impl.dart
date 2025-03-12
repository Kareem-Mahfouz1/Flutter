import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:imdb_top_100/core/api/api_consumer.dart';
import 'package:imdb_top_100/core/api/end_points.dart';
import 'package:imdb_top_100/core/errors/failures.dart';
import 'package:imdb_top_100/features/home/data/models/movie_details.dart';
import 'package:imdb_top_100/features/home/data/models/movie_item.dart';
import 'package:imdb_top_100/features/home/data/repos/movies_repo/movies_repo.dart';

class MoviesRepoImpl implements MoviesRepo {
  final ApiConsumer apiConsumer;
  MoviesRepoImpl(this.apiConsumer);

  @override
  Future<Either<Failure, List<MovieItem>>> getMoviesList() async {
    try {
      final data = await apiConsumer.get('');
      List<MovieItem> movies = [];
      for (var element in data) {
        movies.add(MovieItem.fromJson(element));
      }
      return Right(movies);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int rank) async {
    try {
      final data = await apiConsumer.get('${EndPoints.movieDetails}$rank');
      return Right(MovieDetails.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }
}
