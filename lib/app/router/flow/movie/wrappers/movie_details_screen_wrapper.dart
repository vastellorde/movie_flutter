import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/movie/presentation/movie_details/ui/movie_details_screen.dart';

@RoutePage()
class MovieDetailsScreenWrapper extends StatelessWidget {
  const MovieDetailsScreenWrapper({
    @PathParam('id') required this.movieId,
    super.key,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return MovieDetailsScreen(
      movieId: movieId,
    );
  }
}
