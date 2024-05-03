part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent with EquatableMixin {
  const MovieDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class MovieDetailsRequestedEvent extends MovieDetailsEvent {
  const MovieDetailsRequestedEvent(this.movieId);

  final int movieId;
}
