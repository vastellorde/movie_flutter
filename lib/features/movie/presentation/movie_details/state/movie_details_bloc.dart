import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/domain/models/movie_detail.dart';
import 'package:movie/features/movie/domain/usecase/get_movie_detail_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

final class MovieDetailsBloc
    extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({required GetMovieDetailUsecase getMovieDetailUsecase})
      : _getMovieDetailUsecase = getMovieDetailUsecase,
        super(const LoadingMovieDetailsState()) {
    on<MovieDetailsRequestedEvent>(_onGetMovieDetails);
  }

  final GetMovieDetailUsecase _getMovieDetailUsecase;

  FutureOr<void> _onGetMovieDetails(
    MovieDetailsRequestedEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final response = await _getMovieDetailUsecase.invoke(
      GetMovieDetailUsecaseParams(movieId: event.movieId),
    );

    response.fold(
      onFailure: (f) {
        emit(
          ErrorMovieDetailsState(f.reason),
        );
      },
      onSuccess: (s) {
        emit(LoadedMovieDetailsState(s));
      },
    );
  }
}
