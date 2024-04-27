import 'package:auto_route/auto_route.dart';
import 'package:movie/app/router/flow/movie/movie_flow.dart';
import 'package:movie/app/router/flow/movie/wrappers/movie_list_screen_wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Flow|ScreenWrapper,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        MovieFlow.route,
      ];
}
