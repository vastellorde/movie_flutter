part of 'movie_details_bloc.dart';

sealed class MovieDetailsState with EquatableMixin {
  const MovieDetailsState();

  @override
  List<Object?> get props => [];
}

class LoadingMovieDetailsState extends MovieDetailsState {
  const LoadingMovieDetailsState();
}
