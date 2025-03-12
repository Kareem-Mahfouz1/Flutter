part of 'series_cubit.dart';

sealed class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

final class SeriesInitial extends SeriesState {}

final class SeriesLoading extends SeriesState {}

final class SeriesFailure extends SeriesState {
  final String errMessage;

  const SeriesFailure({required this.errMessage});
}

final class SeriesSuccess extends SeriesState {
  final List<SeriesItem> series;

  const SeriesSuccess({required this.series});
}
