import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie/features/movie/domain/models/movie.dart';
import 'package:movie/features/movie/domain/usecase/get_movie_list_usecase.dart';

part 'movie_list_event.dart';

part 'movie_list_state.dart';

part 'movie_list_bloc.freezed.dart';

final class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc({
    required GetMovieListUsecase getMovieListUsecase,
  })  : _getMovieListUsecase = getMovieListUsecase,
        super(
          MovieListState.initial(),
        ) {
    on<MovieListRequestedEvent>(_onMovieListRequested);
  }

  final GetMovieListUsecase _getMovieListUsecase;

  FutureOr<void> _onMovieListRequested(
    MovieListRequestedEvent event,
    Emitter<MovieListState> emit,
  ) async {
    final response = await _getMovieListUsecase.invoke(
      GetMovieListUsecaseParams(event.page),
    );

    response.fold(
      onFailure: (failure) {
        emit(
          state.copyWith(error: failure.reason),
        );
      },
      onSuccess: (success) {
        final nextPageKey = success.page + 1;
        final isLastPage = nextPageKey >= success.totalPages;
        emit(
          state.copyWith(
            list: [
              ...state.list,
              ...success.results,
            ],
            nextPageKey: isLastPage ? null : nextPageKey,
          ),
        );
      },
    );
  }
}
