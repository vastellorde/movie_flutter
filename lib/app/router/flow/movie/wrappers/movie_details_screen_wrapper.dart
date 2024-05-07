import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/module/module_builder.dart';
import 'package:movie/features/movie/presentation/movie_details/di/movie_details_module.dart';
import 'package:movie/features/movie/presentation/movie_details/state/movie_details_bloc.dart';
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
    return ModuleBuilder<MovieDetailsModule>(
      create: MovieDetailsModule.new,
      builder: (context, di) {
        return BlocProvider<MovieDetailsBloc>.value(
          value: di.get<MovieDetailsBloc>()
            ..add(
              MovieDetailsRequestedEvent(movieId),
            ),
          child: MovieDetailsScreen(
            movieId: movieId,
          ),
        );
      },
    );
  }
}
