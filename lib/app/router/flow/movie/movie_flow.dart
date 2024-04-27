import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie/app/router/router.dart';

@RoutePage()
class MovieFlow extends StatefulWidget {
  const MovieFlow({super.key});

  static AutoRoute route = AutoRoute(
    page: MovieRoute.page,
    initial: true,
    children: [
      AutoRoute(
        page: MovieListRoute.page,
      ),
    ],
  );

  @override
  State<MovieFlow> createState() => _MovieFlowState();
}

class _MovieFlowState extends State<MovieFlow> {
  @override
  void initState() {
    context.router.push(const MovieListRoute());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
