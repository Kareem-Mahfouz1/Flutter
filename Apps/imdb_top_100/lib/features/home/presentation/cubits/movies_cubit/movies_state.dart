part of 'movies_cubit.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

final class MoviesInitial extends MoviesState {}

final class MoviesLoading extends MoviesState {}

final class MoviesFailure extends MoviesState {
  final String errMessage;

  const MoviesFailure({required this.errMessage});
}

final class MoviesSuccess extends MoviesState {
  final List<MovieItem> movies;

  const MoviesSuccess({required this.movies});
}
