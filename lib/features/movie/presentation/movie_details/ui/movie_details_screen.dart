import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/movie_details/state/movie_details_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({required this.movieId, super.key});

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        final text = switch (state) {
          LoadedMovieDetailsState(:final detail) => detail.title,
          _ => 'Error',
        };
        return Scaffold(
          appBar: AppBar(
            title: Text(text),
          ),
          body: ListView(),
        );
      },
    );
  }
}
