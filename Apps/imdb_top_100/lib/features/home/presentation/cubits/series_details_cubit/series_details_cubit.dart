import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_top_100/features/home/data/models/series_details.dart';
import 'package:imdb_top_100/features/home/data/repos/series_repo/series_repo.dart';

part 'series_details_state.dart';

class SeriesDetailsCubit extends Cubit<SeriesDetailsState> {
  SeriesDetailsCubit(this.seriesRepo) : super(SeriesDetailsInitial());
  final SeriesRepo seriesRepo;
  void getSeriesDetails(int rank) async {
    final result = await seriesRepo.getSeriesDetails(rank);
    result.fold(
      (left) {
        emit(SeriesDetailsFailure(errMessage: left.errMessage));
      },
      (right) {
        emit(SeriesDetailsSuccess(details: right));
      },
    );
  }
}
