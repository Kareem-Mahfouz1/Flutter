part of 'movie_details_cubit.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();

  @override
  List<Object> get props => [];
}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errMessage;

  const MovieDetailsFailure({required this.errMessage});
}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieDetails details;

  const MovieDetailsSuccess({required this.details});
}
