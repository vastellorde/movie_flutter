import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/app/router/router.dart';
import 'package:movie/core/module/module_factory.dart';
import 'package:movie/features/movie/di/movie_module.dart';

@RoutePage()
class MovieFlow extends StatefulWidget {
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
      RedirectRoute(path: '', redirectTo: 'list'),
    ],
  );

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  @override
  void initState() {
    //context.router.push(const MovieListRoute());
    debugPrint('wtf?');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModuleFactory(
      module: MovieModule(),
      builder: (context, _) {
        return const AutoRouter(
          inheritNavigatorObservers: false,
        );
      },
    );
  }
}
