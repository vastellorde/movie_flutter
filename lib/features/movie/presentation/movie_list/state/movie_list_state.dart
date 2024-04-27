part of 'movie_list_bloc.dart';

sealed class MovieListState with EquatableMixin {
  const MovieListState();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

final class LoadingMovieListState extends MovieListState {
  const LoadingMovieListState();
}

final class LoadedMovieListState extends MovieListState {
  const LoadedMovieListState(this.list);
  final List<Movie> list;

  @override
  List<Object?> get props => [list];
}

final class FailedMovieListState extends MovieListState {
  const FailedMovieListState(this.reason);

  final String reason;

  @override
  List<Object?> get props => [reason];
}
