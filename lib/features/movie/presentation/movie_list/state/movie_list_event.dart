part of 'movie_list_bloc.dart';

sealed class MovieListEvent with EquatableMixin {
  const MovieListEvent();

  @override
  List<Object?> get props => [];
}

final class MovieListRequestedEvent extends MovieListEvent {
  const MovieListRequestedEvent();
}
