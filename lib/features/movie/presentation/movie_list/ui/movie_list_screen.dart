import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/movie_list/state/movie_list_bloc.dart';
import 'package:movie/features/movie/presentation/movie_list/ui/widgets/movie_list_view.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (context, state) {
          return switch (state) {
            LoadingMovieListState() => const CircularProgressIndicator(),
            LoadedMovieListState(:final list) => MovieListView(
                movieList: list,
              ),
            FailedMovieListState(:final reason) => Text(reason),
          };
        },
      ),
    );
  }
}
