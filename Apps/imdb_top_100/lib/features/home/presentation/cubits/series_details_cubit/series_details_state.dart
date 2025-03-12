part of 'series_details_cubit.dart';

sealed class SeriesDetailsState extends Equatable {
  const SeriesDetailsState();

  @override
  List<Object> get props => [];
}

final class SeriesDetailsInitial extends SeriesDetailsState {}

final class SeriesDetailsLoading extends SeriesDetailsState {}

final class SeriesDetailsFailure extends SeriesDetailsState {
  final String errMessage;

  const SeriesDetailsFailure({required this.errMessage});
}

final class SeriesDetailsSuccess extends SeriesDetailsState {
  final SeriesDetails details;

  const SeriesDetailsSuccess({required this.details});
}
