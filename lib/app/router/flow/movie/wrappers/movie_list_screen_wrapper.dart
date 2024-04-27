import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/features/movie/presentation/movie_list/ui/movie_list_screen.dart';

@RoutePage()
class MovieListScreenWrapper extends StatelessWidget {
  const MovieListScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const MovieListScreen();
  }
}
