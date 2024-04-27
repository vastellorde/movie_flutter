import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/core/usecase/usecase.dart';
import 'package:movie/features/movie/domain/models/movie.dart';
import 'package:movie/features/movie/domain/usecase/get_movie_list_usecase.dart';

part 'movie_list_event.dart';
part 'movie_list_state.dart';

final class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc({
    required GetMovieListUsecase getMovieListUsecase,
  })  : _getMovieListUsecase = getMovieListUsecase,
        super(
          const LoadingMovieListState(),
        ) {
    on<MovieListRequestedEvent>(_onMovieListRequested);
  }

  final GetMovieListUsecase _getMovieListUsecase;

  FutureOr<void> _onMovieListRequested(
    MovieListRequestedEvent event,
    Emitter<MovieListState> emit,
  ) async {
    final response =
        await _getMovieListUsecase.invoke(const EmptyUsecaseParams());

    response.fold(
      onFailure: (failure) {
        emit(
          FailedMovieListState(failure.reason),
        );
      },
      onSuccess: (success) {
        emit(
          LoadedMovieListState(success.results),
        );
      },
    );
  }
}
