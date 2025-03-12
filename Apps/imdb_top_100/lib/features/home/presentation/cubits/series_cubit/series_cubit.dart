import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/features/home/data/models/series_item.dart';
import 'package:imdb_top_100/features/home/data/repos/series_repo/series_repo.dart';

part 'series_state.dart';

class SeriesCubit extends Cubit<SeriesState> {
  SeriesCubit(this.seriesRepo) : super(SeriesInitial());
  final SeriesRepo seriesRepo;
  void getSeriesList() async {
    emit(SeriesLoading());
    final result = await seriesRepo.getSeriesList();
    result.fold(
      (left) {
        emit(SeriesFailure(errMessage: left.errMessage));
      },
      (right) {
        emit(SeriesSuccess(series: right));
      },
    );
  }
}
