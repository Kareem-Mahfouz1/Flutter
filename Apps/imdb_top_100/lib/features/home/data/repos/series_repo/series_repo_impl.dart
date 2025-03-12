import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:imdb_top_100/core/api/api_consumer.dart';
import 'package:imdb_top_100/core/api/end_points.dart';
import 'package:imdb_top_100/core/errors/failures.dart';
import 'package:imdb_top_100/features/home/data/models/series_details.dart';
import 'package:imdb_top_100/features/home/data/models/series_item.dart';
import 'package:imdb_top_100/features/home/data/repos/series_repo/series_repo.dart';

class SeriesRepoImpl implements SeriesRepo {
  final ApiConsumer apiConsumer;

  SeriesRepoImpl(this.apiConsumer);
  @override
  Future<Either<Failure, List<SeriesItem>>> getSeriesList() async {
    try {
      final data = await apiConsumer.get(EndPoints.seriesList);
      final List<SeriesItem> series = [];
      for (var element in data) {
        series.add(SeriesItem.fromJson(element));
      }
      return Right(series);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }

  @override
  Future<Either<Failure, SeriesDetails>> getSeriesDetails(int rank) async {
    try {
      final data = await apiConsumer.get('${EndPoints.seriesDetails}$rank');
      return Right(SeriesDetails.fromJson(data));
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    }
  }
}
