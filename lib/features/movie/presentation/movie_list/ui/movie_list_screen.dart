import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie/features/movie/domain/models/movie.dart';
import 'package:movie/features/movie/presentation/movie_list/state/movie_list_bloc.dart';
import 'package:movie/features/movie/presentation/movie_list/ui/widgets/movie_item.dart';
import 'package:movie/features/movie/presentation/movie_list/utils/types.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({
    required this.onMoviePressed,
    super.key,
  });

  final OnMoviePressed onMoviePressed;

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final PagingController<int, Movie> _controller = PagingController<int, Movie>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    _controller.addPageRequestListener(_fetchNewItems);
  }

  @override
  void dispose() {
    _controller
      ..dispose()
      ..removePageRequestListener(_fetchNewItems);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieListBloc, MovieListState>(
      listener: (context, state) {
        _controller.value = PagingState(
          nextPageKey: state.nextPageKey,
          error: state.error,
          itemList: state.list,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movie List'),
        ),
        body: PagedListView<int, Movie>(
          pagingController: _controller,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, item, index) {
              return MovieItem(
                movie: item,
                onMoviePressed: widget.onMoviePressed,
              );
            },
          ),
        ),
      ),
    );
  }

  void _fetchNewItems(int pageKey) {
    context.read<MovieListBloc>().add(MovieListRequestedEvent(pageKey));
  }
}
