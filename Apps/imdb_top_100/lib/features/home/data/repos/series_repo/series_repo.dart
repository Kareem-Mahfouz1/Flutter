import 'package:dartz/dartz.dart';
import 'package:imdb_top_100/core/errors/failures.dart';
import 'package:imdb_top_100/features/home/data/models/series_details.dart';
import 'package:imdb_top_100/features/home/data/models/series_item.dart';

abstract class SeriesRepo {
  Future<Either<Failure, List<SeriesItem>>> getSeriesList();
  Future<Either<Failure, SeriesDetails>> getSeriesDetails(int rank);
}
