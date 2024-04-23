import 'package:auto_route/auto_route.dart';
import 'package:movie/features/movie_list/presentation/ui/movie_list_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MovieListRoute.page,
          initial: true,
        ),
      ];
}
