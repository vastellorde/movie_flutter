import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movie/presentation/movie_list/state/movie_list_bloc.dart';

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
            LoadedMovieListState() => ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    state.list[index].title,
                  );
                },
                itemCount: state.list.length,
              ),
            FailedMovieListState(:final reason) => Text(reason),
          };
        },
      ),
    );
  }
}
