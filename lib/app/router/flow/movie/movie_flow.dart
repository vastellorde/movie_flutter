import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/app/router/router.dart';
import 'package:movie/core/module/module_factory.dart';
import 'package:movie/features/movie/di/movie_module.dart';

@RoutePage()
class MovieFlow extends StatelessWidget {
  const MovieFlow({super.key});

  static AutoRoute route = AutoRoute(
    page: MovieRoute.page,
    path: '/movie',
    initial: true,
    children: [
      AutoRoute(
        page: MovieListRoute.page,
        path: 'list',
      ),
      AutoRoute(
        page: MovieDetailsRoute.page,
        path: 'details/:id',
      ),
      RedirectRoute(path: '', redirectTo: 'list'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ModuleFactory(
      module: MovieModule(),
      builder: (context, _) {
        return const AutoRouter();
      },
    );
  }
}
