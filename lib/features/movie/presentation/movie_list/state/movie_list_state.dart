part of 'movie_list_bloc.dart';

@freezed
sealed class MovieListState with _$MovieListState {
  const factory MovieListState({
    int? nextPageKey,
    String? error,
    @Default([]) List<Movie> list,
  }) = _MovieListState;

  factory MovieListState.initial() => const MovieListState(nextPageKey: 1);
}
