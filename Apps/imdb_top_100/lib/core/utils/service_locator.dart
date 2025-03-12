import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:imdb_top_100/core/api/api_consumer.dart';
import 'package:imdb_top_100/core/api/dio_consumer.dart';
import 'package:imdb_top_100/features/home/data/repos/movies_repo/movies_repo_impl.dart';
import 'package:imdb_top_100/features/home/data/repos/series_repo/series_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiConsumer>(DioConsumer(dio: Dio()));

  getIt.registerSingleton<MoviesRepoImpl>(
    MoviesRepoImpl(getIt.get<ApiConsumer>()),
  );
  getIt.registerSingleton<SeriesRepoImpl>(
    SeriesRepoImpl(getIt.get<ApiConsumer>()),
  );
}
