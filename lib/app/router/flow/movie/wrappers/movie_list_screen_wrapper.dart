import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/module/module_builder.dart';
import 'package:movie/features/movie/presentation/movie_list/di/movie_list_module.dart';
import 'package:movie/features/movie/presentation/movie_list/state/movie_list_bloc.dart';
import 'package:movie/features/movie/presentation/movie_list/ui/movie_list_screen.dart';

@RoutePage()
class MovieListScreenWrapper extends StatelessWidget {
  const MovieListScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ModuleBuilder(
      create: MovieListModule.new,
      builder: (context, di) {
        return BlocProvider<MovieListBloc>(
          create: (context) => di.get<MovieListBloc>(),
          child: MovieListScreen(
            onMoviePressed: (id) {
              context.router.pushNamed('/movie/details/$id');
            },
          ),
        );
      },
    );
  }
}
