part of 'movie_details_bloc.dart';

sealed class MovieDetailsState with EquatableMixin {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

final class LoadingMovieDetailsState extends MovieDetailsState {
  const LoadingMovieDetailsState();
}

final class LoadedMovieDetailsState extends MovieDetailsState {
  const LoadedMovieDetailsState(this.detail);

  final MovieDetail detail;

  @override
  List<Object?> get props => [detail];
}

final class ErrorMovieDetailsState extends MovieDetailsState {
  const ErrorMovieDetailsState(this.reason);

  final String reason;

  @override
  List<Object?> get props => [reason];
}
