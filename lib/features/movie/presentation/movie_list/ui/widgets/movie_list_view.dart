import 'package:flutter/material.dart';
import 'package:movie/features/movie/domain/models/movie.dart';
import 'package:movie/features/movie/presentation/movie_list/ui/widgets/movie_item.dart';
import 'package:movie/features/movie/presentation/movie_list/utils/types.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({
    required this.movieList,
    required this.onMoviePressed,
    super.key,
  });

  final List<Movie> movieList;
  final OnMoviePressed onMoviePressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return MovieItem(
          movie: movieList[index],
          onMoviePressed: onMoviePressed,
        );
      },
      itemCount: movieList.length,
    );
  }
}
